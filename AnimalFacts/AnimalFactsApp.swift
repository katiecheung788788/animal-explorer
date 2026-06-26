import SwiftUI

@main
struct AnimalFactsApp: App {
    @StateObject private var viewModel = AnimalViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .preferredColorScheme(.dark)
        }
    }
}
