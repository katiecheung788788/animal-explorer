import Foundation
import Combine

class AnimalViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var selectedCategory: AnimalCategory? = nil
    @Published var selectedRegion: WorldRegion? = nil
    @Published var discoveredIDs: Set<UUID> = []
    @Published var selectedBiome: Biome? = nil

    let animals = allAnimals
    let biomes  = allBiomes

    init() {
        loadDiscovered()
    }

    var filteredAnimals: [Animal] {
        animals.filter { animal in
            let matchesSearch = searchText.isEmpty ||
                animal.name.localizedCaseInsensitiveContains(searchText) ||
                animal.scientific.localizedCaseInsensitiveContains(searchText) ||
                animal.description.localizedCaseInsensitiveContains(searchText) ||
                animal.facts.contains { $0.localizedCaseInsensitiveContains(searchText) }
            let matchesCat    = selectedCategory == nil || animal.category == selectedCategory
            let matchesRegion = selectedRegion   == nil || animal.region   == selectedRegion
            return matchesSearch && matchesCat && matchesRegion
        }
    }

    var discoveryProgress: Double {
        animals.isEmpty ? 0 : Double(discoveredIDs.count) / Double(animals.count)
    }

    func markDiscovered(_ animal: Animal) {
        discoveredIDs.insert(animal.id)
        saveDiscovered()
    }

    func isDiscovered(_ animal: Animal) -> Bool {
        discoveredIDs.contains(animal.id)
    }

    func animals(for biome: Biome) -> [Animal] {
        animals.filter { biome.animalRegions.contains($0.region) }
               .filter { biome.animalCategories.contains($0.category) }
    }

    func randomAnimal() -> Animal? {
        filteredAnimals.randomElement()
    }

    private func saveDiscovered() {
        let raw = discoveredIDs.map { $0.uuidString }
        UserDefaults.standard.set(raw, forKey: "ae_discovered")
    }

    private func loadDiscovered() {
        let raw = UserDefaults.standard.stringArray(forKey: "ae_discovered") ?? []
        discoveredIDs = Set(raw.compactMap { UUID(uuidString: $0) })
    }
}
