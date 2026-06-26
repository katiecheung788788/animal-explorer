import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: AnimalViewModel

    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "square.grid.2x2.fill")
                }

            WorldMapView()
                .tabItem {
                    Label("World Map", systemImage: "globe.americas.fill")
                }

            BiomeWalkthroughView()
                .tabItem {
                    Label("Biomes", systemImage: "leaf.fill")
                }
        }
        .tint(Color(red: 0.94, green: 0.82, blue: 0.48))
    }
}
