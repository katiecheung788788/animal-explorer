import SwiftUI

struct AnimalCardView: View {
    let animal: Animal
    let isDiscovered: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                AnimalImageView(animal: animal, height: 160)

                if isDiscovered {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 22))
                        .foregroundColor(Color(red: 0.94, green: 0.82, blue: 0.48))
                        .shadow(radius: 4)
                        .padding(8)
                }

                // Conservation status chip
                Text(animal.status.shortCode)
                    .font(.system(size: 10, weight: .bold))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .background(animal.status.color.opacity(0.85))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(animal.name)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(red: 0.87, green: 0.92, blue: 0.80))
                    .lineLimit(1)

                HStack(spacing: 4) {
                    Text(animal.category.emoji)
                    Text(animal.category.displayName)
                        .font(.system(size: 11))
                        .foregroundColor(animal.category.color)
                    Spacer()
                    Text(animal.region.emoji)
                        .font(.system(size: 11))
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
        }
        .background(Color(red: 0.07, green: 0.12, blue: 0.07))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color(red: 0.12, green: 0.21, blue: 0.12), lineWidth: 1)
        )
    }
}
