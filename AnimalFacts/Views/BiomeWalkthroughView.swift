import SwiftUI
import MapKit

private let accent   = Color(red: 0.94, green: 0.82, blue: 0.48)
private let bgColor  = Color(red: 0.035, green: 0.059, blue: 0.035)
private let cardBg   = Color(red: 0.07, green: 0.12, blue: 0.07)

// MARK: - Biome List

struct BiomeWalkthroughView: View {
    @EnvironmentObject var vm: AnimalViewModel
    @State private var selectedBiome: Biome? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                bgColor.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 0) {
                        header
                        biomeList
                    }
                }
            }
            .navigationTitle("Biome Explorer")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(Color(red: 0.05, green: 0.09, blue: 0.05), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationDestination(item: $selectedBiome) { biome in
                BiomeDetailView(biome: biome)
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Explore Earth's great biomes through satellite imagery and street-level views. Discover the animals that call each environment home.")
                .font(.system(size: 14))
                .foregroundColor(Color(red: 0.42, green: 0.54, blue: 0.36))
                .lineSpacing(4)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.04, green: 0.08, blue: 0.04))
    }

    private var biomeList: some View {
        LazyVStack(spacing: 14) {
            ForEach(vm.biomes) { biome in
                BiomeTileView(biome: biome, animalCount: vm.animals(for: biome).count)
                    .onTapGesture { selectedBiome = biome }
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 14)
    }
}

// MARK: - Biome Tile (list item)

struct BiomeTileView: View {
    let biome: Biome
    let animalCount: Int
    @StateObject private var loader = WikiImageLoader()

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background image
            ZStack {
                LinearGradient(colors: [Color(red:0.04,green:0.10,blue:0.04),
                                        Color(red:0.07,green:0.16,blue:0.07)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                if let url = loader.imageURL {
                    AsyncImage(url: url) { phase in
                        if case .success(let img) = phase {
                            img.resizable().scaledToFill().opacity(0.55)
                        }
                    }
                } else {
                    Text(biome.emoji).font(.system(size: 72)).opacity(0.3)
                }
            }
            .frame(height: 140)
            .clipped()

            // Gradient overlay
            LinearGradient(colors: [.clear, .black.opacity(0.75)],
                           startPoint: .top, endPoint: .bottom)

            // Text overlay
            VStack(alignment: .leading, spacing: 4) {
                Text(biome.emoji + " " + biome.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                HStack(spacing: 6) {
                    Text(biome.climate.prefix(40) + "…")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.75))
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "pawprint.fill")
                            .font(.system(size: 11))
                        Text("\(animalCount) animals")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .foregroundColor(accent)
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12))
                        .foregroundColor(accent)
                }
            }
            .padding(14)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(red:0.12,green:0.21,blue:0.12), lineWidth: 1))
        .onAppear { loader.load(title: biome.wikipediaTitle) }
    }
}

// MARK: - Biome Detail

struct BiomeDetailView: View {
    let biome: Biome
    @EnvironmentObject var vm: AnimalViewModel
    @Environment(\.dismiss) var dismiss

    @State private var lookAroundScene: MKLookAroundScene?
    @State private var showLookAround = false
    @State private var mapStyle: BiomeMapStyle = .satellite
    @State private var selectedAnimal: Animal?

    enum BiomeMapStyle { case satellite, standard, hybrid }

    var biomeAnimals: [Animal] { vm.animals(for: biome) }

    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 0) {
                    mapSection
                    VStack(spacing: 16) {
                        walkThroughButtons
                        descriptionSection
                        keyFactsSection
                        animalsSection
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
            }
        }
        .navigationTitle(biome.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
        .fullScreenCover(isPresented: $showLookAround) {
            if let scene = lookAroundScene {
                LookAroundPreviewFullscreen(scene: scene, title: biome.name)
            }
        }
        .task { await loadLookAround() }
    }

    // MARK: - Map Section
    private var mapSection: some View {
        ZStack(alignment: .topTrailing) {
            Map(initialPosition: .region(MKCoordinateRegion(
                    center: biome.centerCoordinate,
                    span: MKCoordinateSpan(latitudeDelta: biome.zoomDelta * 4,
                                           longitudeDelta: biome.zoomDelta * 5)
            )))
            .mapStyle(currentMapStyle)
            .frame(height: 320)

            // Map style toggle
            VStack(spacing: 6) {
                MapStyleButton(icon: "globe.americas.fill", label: "Satellite",
                               isActive: mapStyle == .satellite) { mapStyle = .satellite }
                MapStyleButton(icon: "map.fill", label: "Standard",
                               isActive: mapStyle == .standard) { mapStyle = .standard }
                MapStyleButton(icon: "map", label: "Hybrid",
                               isActive: mapStyle == .hybrid) { mapStyle = .hybrid }
            }
            .padding(10)

            // Location pin
            VStack {
                Spacer()
                HStack {
                    Text(biome.emoji + " " + biome.name)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.black.opacity(0.6))
                        .clipShape(Capsule())
                    Spacer()
                }
                .padding(10)
            }
            .frame(height: 320)
        }
    }

    private var currentMapStyle: MapStyle {
        switch mapStyle {
        case .satellite: return .imagery(elevation: .realistic)
        case .standard:  return .standard(elevation: .realistic)
        case .hybrid:    return .hybrid(elevation: .realistic)
        }
    }

    // MARK: - Walkthrough Buttons
    private var walkThroughButtons: some View {
        VStack(spacing: 10) {
            Text("WALKTHROUGH OPTIONS")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(accent)
                .kerning(1.2)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 10) {
                // Apple Look Around
                Button {
                    if lookAroundScene != nil {
                        showLookAround = true
                    }
                } label: {
                    VStack(spacing: 6) {
                        Image(systemName: lookAroundScene != nil ? "binoculars.fill" : "binoculars")
                            .font(.system(size: 22))
                        Text(lookAroundScene != nil ? "Look Around" : "No Coverage")
                            .font(.system(size: 12, weight: .semibold))
                        Text(lookAroundScene != nil ? "Street-level view" : "in this area")
                            .font(.system(size: 10))
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(lookAroundScene != nil
                                ? Color(red: 0.09, green: 0.28, blue: 0.50)
                                : cardBg)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .foregroundColor(.white)
                }
                .disabled(lookAroundScene == nil)

                // Google Maps Satellite
                Button { openGoogleMapsSatellite() } label: {
                    VStack(spacing: 6) {
                        Image(systemName: "map.fill")
                            .font(.system(size: 22))
                        Text("Google Maps")
                            .font(.system(size: 12, weight: .semibold))
                        Text("Satellite view")
                            .font(.system(size: 10))
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color(red: 0.13, green: 0.42, blue: 0.14))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .foregroundColor(.white)
                }

                // Google Street View
                Button { openGoogleStreetView() } label: {
                    VStack(spacing: 6) {
                        Image(systemName: "person.fill.viewfinder")
                            .font(.system(size: 22))
                        Text("Street View")
                            .font(.system(size: 12, weight: .semibold))
                        Text("Ground level")
                            .font(.system(size: 10))
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color(red: 0.48, green: 0.12, blue: 0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .foregroundColor(.white)
                }
            }
        }
        .padding(14)
        .background(cardBg)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    // MARK: - Description
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("ABOUT THIS BIOME")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(accent)
                .kerning(1.2)

            Text(biome.description)
                .font(.system(size: 14))
                .foregroundColor(Color(red: 0.80, green: 0.85, blue: 0.73))
                .lineSpacing(5)

            HStack(spacing: 6) {
                Image(systemName: "thermometer.medium")
                    .foregroundColor(accent)
                    .font(.system(size: 13))
                Text(biome.climate)
                    .font(.system(size: 13))
                    .foregroundColor(Color(red: 0.42, green: 0.54, blue: 0.36))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(cardBg)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    // MARK: - Key Facts
    private var keyFactsSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("KEY FACTS")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(accent)
                .kerning(1.2)
                .padding(.bottom, 8)

            ForEach(Array(biome.keyFacts.enumerated()), id: \.offset) { idx, fact in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(accent)
                        .padding(.top, 3)
                    Text(fact)
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 0.80, green: 0.85, blue: 0.73))
                        .lineSpacing(3)
                }
                .padding(.vertical, 8)
                if idx < biome.keyFacts.count - 1 {
                    Divider().background(Color(red: 0.12, green: 0.21, blue: 0.12))
                }
            }
        }
        .padding(14)
        .background(cardBg)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    // MARK: - Animals of this Biome
    private var animalsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("ANIMALS OF THIS BIOME")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(accent)
                .kerning(1.2)

            if biomeAnimals.isEmpty {
                Text("No matching animals for current filter.")
                    .font(.system(size: 13))
                    .foregroundColor(Color(red: 0.42, green: 0.54, blue: 0.36))
            } else {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()),
                                    GridItem(.flexible())], spacing: 10) {
                    ForEach(biomeAnimals.prefix(12)) { animal in
                        BiomeAnimalCell(animal: animal)
                            .onTapGesture { selectedAnimal = animal }
                    }
                }
                if biomeAnimals.count > 12 {
                    Text("+ \(biomeAnimals.count - 12) more animals →")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(accent)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .padding(14)
        .background(cardBg)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    // MARK: - Helpers

    private func loadLookAround() async {
        let req = MKLookAroundSceneRequest(coordinate: biome.streetViewCoordinate)
        lookAroundScene = try? await req.scene
    }

    private func openGoogleMapsSatellite() {
        let lat = biome.centerLat
        let lon = biome.centerLon
        if let url = URL(string: "comgooglemaps://?center=\(lat),\(lon)&zoom=11&maptype=satellite"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else if let url = URL(string: "https://maps.google.com/maps?q=\(lat),\(lon)&t=k&z=11") {
            UIApplication.shared.open(url)
        }
    }

    private func openGoogleStreetView() {
        let lat = biome.streetViewLat
        let lon = biome.streetViewLon
        if let url = URL(string: "comgooglemaps://?cbll=\(lat),\(lon)&maptype=streetview"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else if let url = URL(string: "https://maps.google.com/maps?q=&layer=c&cbll=\(lat),\(lon)") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - Biome Animal Cell

struct BiomeAnimalCell: View {
    let animal: Animal
    @StateObject private var loader = WikiImageLoader()

    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                LinearGradient(colors: animal.category.bgColors,
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(animal.emoji).font(.system(size: 28))
                if let url = loader.imageURL {
                    AsyncImage(url: url) { phase in
                        if case .success(let img) = phase {
                            img.resizable().scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            .frame(height: 72)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            Text(animal.name)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(Color(red: 0.80, green: 0.85, blue: 0.73))
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .onAppear { loader.load(title: animal.wikipediaTitle) }
    }
}

// MARK: - Map Style Toggle Button

struct MapStyleButton: View {
    let icon: String
    let label: String
    let isActive: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 2) {
                Image(systemName: icon)
                    .font(.system(size: 15))
                Text(label)
                    .font(.system(size: 9, weight: .semibold))
            }
            .foregroundColor(isActive ? .black : .white)
            .frame(width: 54, height: 42)
            .background(isActive ? accent2 : Color.black.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

private let accent2 = Color(red: 0.94, green: 0.82, blue: 0.48)
