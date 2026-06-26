import SwiftUI

// Shared component used across cards and detail views.
// Loads the real animal photo from Wikipedia's REST API, falls back to emoji.
struct AnimalImageView: View {
    let animal: Animal
    var height: CGFloat = 220
    var cornerRadius: CGFloat = 0

    @StateObject private var loader = WikiImageLoader()

    var body: some View {
        ZStack {
            LinearGradient(
                colors: animal.category.bgColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Text(animal.emoji)
                .font(.system(size: height * 0.40))
                .opacity(loader.imageURL == nil ? 1 : 0)

            if let url = loader.imageURL {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .transition(.opacity.animation(.easeIn(duration: 0.3)))
                    case .failure:
                        EmptyView()
                    default:
                        ProgressView()
                            .tint(.white.opacity(0.5))
                    }
                }
            }
        }
        .frame(height: height)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .onAppear { loader.load(title: animal.wikipediaTitle) }
    }
}

// Compact square thumbnail used in biome animal grids
struct AnimalThumbView: View {
    let animal: Animal
    @StateObject private var loader = WikiImageLoader()

    var body: some View {
        ZStack {
            LinearGradient(colors: animal.category.bgColors,
                           startPoint: .topLeading, endPoint: .bottomTrailing)
            Text(animal.emoji).font(.system(size: 28))
            if let url = loader.imageURL {
                AsyncImage(url: url) { phase in
                    if case .success(let img) = phase {
                        img.resizable().scaledToFill()
                    }
                }
            }
        }
        .frame(width: 60, height: 60)
        .clipShape(Circle())
        .onAppear { loader.load(title: animal.wikipediaTitle) }
    }
}
