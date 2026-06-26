import SwiftUI
import MapKit

private let accent = Color(red: 0.94, green: 0.82, blue: 0.48)

struct WorldMapView: View {
    @EnvironmentObject var vm: AnimalViewModel
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 20, longitude: 0),
                           span: MKCoordinateSpan(latitudeDelta: 130, longitudeDelta: 180))
    )
    @State private var selectedRegion: WorldRegion? = nil
    @State private var selectedAnimal: Animal? = nil

    var displayedAnimals: [Animal] {
        guard let reg = selectedRegion else { return vm.animals }
        return vm.animals.filter { $0.region == reg }
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                // Realistic satellite world map
                Map(position: $cameraPosition, selection: .constant(nil as MKMapItem?)) {
                    ForEach(displayedAnimals) { animal in
                        Annotation(animal.name, coordinate: animal.habitatCoordinate) {
                            AnimalMapPin(animal: animal, isDiscovered: vm.isDiscovered(animal))
                                .onTapGesture { selectedAnimal = animal }
                        }
                    }
                }
                .mapStyle(.imagery(elevation: .realistic))
                .ignoresSafeArea(edges: .horizontal)

                // Region filter bottom sheet
                VStack(spacing: 0) {
                    regionSelector
                }
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 12)
                .padding(.bottom, 12)
                .shadow(radius: 12)
            }
            .navigationTitle("World Map")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .sheet(item: $selectedAnimal) { animal in
                AnimalDetailView(animal: animal)
            }
        }
    }

    // MARK: - Region Selector
    private var regionSelector: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("Filter by continent")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.secondary)
                Spacer()
                if selectedRegion != nil {
                    Button("Show All") {
                        selectedRegion = nil
                        flyToWorld()
                    }
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(accent)
                }
            }
            .padding(.horizontal, 14)
            .padding(.top, 12)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(WorldRegion.allCases) { region in
                        Button {
                            withAnimation {
                                if selectedRegion == region {
                                    selectedRegion = nil
                                    flyToWorld()
                                } else {
                                    selectedRegion = region
                                    flyTo(region)
                                }
                            }
                        } label: {
                            HStack(spacing: 4) {
                                Text(region.emoji)
                                Text(region.displayName)
                                    .font(.system(size: 13, weight: selectedRegion == region ? .bold : .regular))
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 7)
                            .background(selectedRegion == region ? accent.opacity(0.25) : Color.white.opacity(0.08))
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(selectedRegion == region ? accent : Color.white.opacity(0.15), lineWidth: 1))
                            .foregroundColor(selectedRegion == region ? accent : .primary)
                        }
                    }
                }
                .padding(.horizontal, 14)
            }

            HStack {
                Image(systemName: "info.circle")
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
                Text("Tap any animal pin to see its details")
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 14)
            .padding(.bottom, 12)
        }
    }

    private func flyTo(_ region: WorldRegion) {
        cameraPosition = .region(
            MKCoordinateRegion(
                center: region.coordinate,
                span: MKCoordinateSpan(latitudeDelta: region.latDelta, longitudeDelta: region.latDelta * 1.4)
            )
        )
    }

    private func flyToWorld() {
        cameraPosition = .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 20, longitude: 0),
                span: MKCoordinateSpan(latitudeDelta: 130, longitudeDelta: 180)
            )
        )
    }
}

// MARK: - Map Pin

struct AnimalMapPin: View {
    let animal: Animal
    let isDiscovered: Bool

    var body: some View {
        ZStack {
            Circle()
                .fill(isDiscovered ? accent.opacity(0.9) : Color(red: 0.07, green: 0.12, blue: 0.07).opacity(0.9))
                .frame(width: 36, height: 36)
                .overlay(Circle().stroke(isDiscovered ? accent : Color.white.opacity(0.3), lineWidth: 1.5))
                .shadow(radius: 4)

            Text(animal.emoji)
                .font(.system(size: 20))
        }
    }
}

private let accent2 = Color(red: 0.94, green: 0.82, blue: 0.48)
