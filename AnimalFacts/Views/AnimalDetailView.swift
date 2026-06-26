import SwiftUI
import MapKit

private let accent = Color(red: 0.94, green: 0.82, blue: 0.48)
private let cardBg  = Color(red: 0.07, green: 0.12, blue: 0.07)
private let subtext = Color(red: 0.42, green: 0.54, blue: 0.36)

struct AnimalDetailView: View {
    let animal: Animal
    @EnvironmentObject var vm: AnimalViewModel
    @Environment(\.dismiss) var dismiss

    @State private var lookAroundScene: MKLookAroundScene?
    @State private var showLookAround = false
    @State private var factsVisible = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.035, green: 0.059, blue: 0.035).ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 0) {
                        heroImage
                        VStack(spacing: 16) {
                            badges
                            description
                            factsList
                            habitatSection
                        }
                        .padding(.horizontal, 18)
                        .padding(.top, 16)
                        .padding(.bottom, 32)
                    }
                }
            }
            .navigationTitle(animal.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") { dismiss() }
                        .foregroundColor(accent)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        openInGoogleMaps()
                    } label: {
                        Label("Google Maps", systemImage: "map.fill")
                            .foregroundColor(accent)
                    }
                }
            }
        }
        .onAppear {
            vm.markDiscovered(animal)
            Task { await loadLookAround() }
        }
        .fullScreenCover(isPresented: $showLookAround) {
            if let scene = lookAroundScene {
                LookAroundPreviewFullscreen(scene: scene, title: animal.habitatName)
            }
        }
    }

    // MARK: - Hero Image
    private var heroImage: some View {
        ZStack(alignment: .bottomLeading) {
            AnimalImageView(animal: animal, height: 300)

            LinearGradient(
                colors: [.clear, Color(red: 0.035, green: 0.059, blue: 0.035)],
                startPoint: .center, endPoint: .bottom
            )
            .frame(height: 300)

            VStack(alignment: .leading, spacing: 4) {
                Text(animal.name)
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.white)
                Text(animal.scientific)
                    .font(.system(size: 14, weight: .regular).italic())
                    .foregroundColor(subtext)
            }
            .padding(16)
        }
        .frame(height: 300)
    }

    // MARK: - Badges
    private var badges: some View {
        HStack(spacing: 8) {
            BadgeView(text: animal.category.displayName,
                      color: animal.category.color,
                      emoji: animal.category.emoji)
            BadgeView(text: animal.status.shortCode,
                      color: animal.status.color)
            BadgeView(text: animal.region.displayName,
                      color: .white.opacity(0.4),
                      emoji: animal.region.emoji)
            Spacer()
        }
    }

    // MARK: - Description
    private var description: some View {
        Text(animal.description)
            .font(.system(size: 15, weight: .regular))
            .foregroundColor(Color(red: 0.80, green: 0.85, blue: 0.73))
            .lineSpacing(5)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Facts
    private var factsList: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("WILD FACTS")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(accent)
                .kerning(1.2)
                .padding(.bottom, 8)

            VStack(spacing: 0) {
                ForEach(Array(animal.facts.enumerated()), id: \.offset) { idx, fact in
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(accent)
                            .padding(.top, 3)
                        Text(fact)
                            .font(.system(size: 14))
                            .foregroundColor(Color(red: 0.80, green: 0.85, blue: 0.73))
                            .lineSpacing(4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 10)
                    .opacity(factsVisible ? 1 : 0)
                    .offset(x: factsVisible ? 0 : -12)
                    .animation(.easeOut(duration: 0.35).delay(Double(idx) * 0.08), value: factsVisible)

                    if idx < animal.facts.count - 1 {
                        Divider().background(Color(red: 0.12, green: 0.21, blue: 0.12))
                    }
                }
            }
        }
        .padding(14)
        .background(cardBg)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(red: 0.12, green: 0.21, blue: 0.12), lineWidth: 1))
        .onAppear { DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { factsVisible = true } }
    }

    // MARK: - Habitat Section
    private var habitatSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("HABITAT")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(accent)
                .kerning(1.2)

            Text(animal.habitatName)
                .font(.system(size: 14))
                .foregroundColor(subtext)

            // Satellite Map Preview (iOS 17+)
            Map(initialPosition: .region(MKCoordinateRegion(
                center: animal.habitatCoordinate,
                span: MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)
            ))) {
                Annotation(animal.name, coordinate: animal.habitatCoordinate) {
                    ZStack {
                        Circle().fill(accent).frame(width: 36, height: 36)
                        Text(animal.emoji).font(.system(size: 20))
                    }
                }
            }
            .mapStyle(.imagery(elevation: .realistic))
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            // Action Buttons
            HStack(spacing: 10) {
                if lookAroundScene != nil {
                    Button {
                        showLookAround = true
                    } label: {
                        Label("Look Around", systemImage: "binoculars.fill")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color(red: 0.09, green: 0.28, blue: 0.50))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(.white)
                    }
                }

                Button {
                    openInGoogleMaps()
                } label: {
                    Label("Google Maps", systemImage: "map.fill")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color(red: 0.13, green: 0.42, blue: 0.14))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.white)
                }
            }
        }
        .padding(14)
        .background(cardBg)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(red: 0.12, green: 0.21, blue: 0.12), lineWidth: 1))
    }

    // MARK: - Helpers

    private func loadLookAround() async {
        let req = MKLookAroundSceneRequest(coordinate: animal.habitatCoordinate)
        lookAroundScene = try? await req.scene
    }

    private func openInGoogleMaps() {
        let lat = animal.habitatLat
        let lon = animal.habitatLon
        if let url = URL(string: "comgooglemaps://?center=\(lat),\(lon)&zoom=12&maptype=satellite"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else if let url = URL(string: "https://maps.google.com/maps?q=\(lat),\(lon)&t=k") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - Badge View

struct BadgeView: View {
    let text: String
    let color: Color
    var emoji: String = ""

    var body: some View {
        HStack(spacing: 3) {
            if !emoji.isEmpty { Text(emoji).font(.system(size: 11)) }
            Text(text)
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(color)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(color.opacity(0.12))
        .clipShape(Capsule())
        .overlay(Capsule().stroke(color.opacity(0.35), lineWidth: 1))
    }
}

// MARK: - LookAround Fullscreen Wrapper

struct LookAroundPreviewFullscreen: View {
    let scene: MKLookAroundScene
    let title: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack(alignment: .topLeading) {
            LookAroundPreview(initialScene: scene)
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .shadow(radius: 6)
                }
                .padding(.top, 50)
                .padding(.leading, 16)

                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                    .padding(.leading, 16)
            }
        }
    }
}

