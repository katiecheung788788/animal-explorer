import SwiftUI

private let accent = Color(red: 0.94, green: 0.82, blue: 0.48)
private let bgColor = Color(red: 0.035, green: 0.059, blue: 0.035)

struct ExploreView: View {
    @EnvironmentObject var vm: AnimalViewModel
    @State private var selectedAnimal: Animal?
    @State private var showSurprise = false

    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                bgColor.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 0) {
                        discoveryBanner
                        categoryFilter
                        regionFilter
                        animalGrid
                    }
                }
            }
            .navigationTitle("Animal Explorer")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(Color(red: 0.05, green: 0.09, blue: 0.05), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if let a = vm.randomAnimal() { selectedAnimal = a }
                    } label: {
                        Label("Surprise", systemImage: "dice.fill")
                            .foregroundColor(accent)
                    }
                }
            }
            .searchable(text: $vm.searchText, placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Search animals, facts…")
            .sheet(item: $selectedAnimal) { animal in
                AnimalDetailView(animal: animal)
            }
        }
    }

    // MARK: - Discovery Banner
    private var discoveryBanner: some View {
        VStack(spacing: 4) {
            HStack {
                Text("\(vm.discoveredIDs.count) / \(vm.animals.count)")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(accent)
                Text("animals discovered")
                    .font(.system(size: 13))
                    .foregroundColor(Color(red: 0.42, green: 0.54, blue: 0.36))
                Spacer()
                Text("\(Int(vm.discoveryProgress * 100))%")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(accent)
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color(red: 0.12, green: 0.21, blue: 0.12))
                    RoundedRectangle(cornerRadius: 3)
                        .fill(LinearGradient(colors: [Color(red: 0.23, green: 0.47, blue: 0.13), accent],
                                             startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * vm.discoveryProgress)
                }
            }
            .frame(height: 6)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color(red: 0.04, green: 0.08, blue: 0.04))
    }

    // MARK: - Category Filter
    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                FilterPill(label: "All", emoji: "🌍", isActive: vm.selectedCategory == nil) {
                    vm.selectedCategory = nil
                }
                ForEach(AnimalCategory.allCases) { cat in
                    FilterPill(label: cat.displayName, emoji: cat.emoji,
                               isActive: vm.selectedCategory == cat,
                               activeColor: cat.color) {
                        vm.selectedCategory = vm.selectedCategory == cat ? nil : cat
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .background(Color(red: 0.05, green: 0.09, blue: 0.05))
    }

    // MARK: - Region Filter
    private var regionFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                FilterPill(label: "All Regions", emoji: "🗺️", isActive: vm.selectedRegion == nil) {
                    vm.selectedRegion = nil
                }
                ForEach(WorldRegion.allCases) { reg in
                    FilterPill(label: reg.displayName, emoji: reg.emoji,
                               isActive: vm.selectedRegion == reg) {
                        vm.selectedRegion = vm.selectedRegion == reg ? nil : reg
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
        }
        .background(Color(red: 0.05, green: 0.09, blue: 0.05))
    }

    // MARK: - Animal Grid
    @ViewBuilder
    private var animalGrid: some View {
        let list = vm.filteredAnimals
        if list.isEmpty {
            VStack(spacing: 12) {
                Text("🔭").font(.system(size: 56))
                Text("No animals found")
                    .font(.headline)
                    .foregroundColor(Color(red: 0.42, green: 0.54, blue: 0.36))
                Text("Try a different search or filter")
                    .font(.subheadline)
                    .foregroundColor(Color(red: 0.30, green: 0.40, blue: 0.25))
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 60)
        } else {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(headerTitle)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(accent)
                    Spacer()
                    Text("\(list.count) animal\(list.count == 1 ? "" : "s")")
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 0.42, green: 0.54, blue: 0.36))
                }
                .padding(.horizontal, 16)
                .padding(.top, 14)

                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(list) { animal in
                        AnimalCardView(animal: animal, isDiscovered: vm.isDiscovered(animal))
                            .onTapGesture { selectedAnimal = animal }
                    }
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 24)
            }
        }
    }

    private var headerTitle: String {
        if let cat = vm.selectedCategory, let reg = vm.selectedRegion {
            return "\(cat.displayName) of \(reg.displayName)"
        } else if let reg = vm.selectedRegion {
            return "Animals of \(reg.displayName)"
        } else if let cat = vm.selectedCategory {
            return "All \(cat.displayName)"
        } else if !vm.searchText.isEmpty {
            return "Results for \"\(vm.searchText)\""
        }
        return "All Animals"
    }
}

// MARK: - Filter Pill

struct FilterPill: View {
    let label: String
    let emoji: String
    let isActive: Bool
    var activeColor: Color = Color(red: 0.94, green: 0.82, blue: 0.48)
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Text(emoji).font(.system(size: 13))
                Text(label).font(.system(size: 13, weight: isActive ? .bold : .regular))
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(isActive ? activeColor.opacity(0.18) : Color(red: 0.07, green: 0.12, blue: 0.07))
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(isActive ? activeColor : Color(red: 0.12, green: 0.21, blue: 0.12), lineWidth: 1)
            )
            .foregroundColor(isActive ? activeColor : Color(red: 0.42, green: 0.54, blue: 0.36))
        }
    }
}
