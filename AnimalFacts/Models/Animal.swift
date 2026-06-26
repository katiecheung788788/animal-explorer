import Foundation
import MapKit
import SwiftUI

// MARK: - Category

enum AnimalCategory: String, CaseIterable, Identifiable {
    case mammals, reptiles, birds, fish, insects, amphibians
    var id: String { rawValue }
    var displayName: String { rawValue.capitalized }

    var emoji: String {
        switch self {
        case .mammals:    return "🐘"
        case .reptiles:   return "🐊"
        case .birds:      return "🦅"
        case .fish:       return "🦈"
        case .insects:    return "🦋"
        case .amphibians: return "🐸"
        }
    }

    var color: Color {
        switch self {
        case .mammals:    return Color(red: 0.18, green: 0.43, blue: 0.13)
        case .reptiles:   return Color(red: 0.48, green: 0.23, blue: 0.06)
        case .birds:      return Color(red: 0.09, green: 0.28, blue: 0.50)
        case .fish:       return Color(red: 0.03, green: 0.38, blue: 0.38)
        case .insects:    return Color(red: 0.44, green: 0.38, blue: 0.00)
        case .amphibians: return Color(red: 0.29, green: 0.09, blue: 0.47)
        }
    }

    var bgColors: [Color] {
        switch self {
        case .mammals:    return [Color(red:0.05,green:0.13,blue:0.04), Color(red:0.09,green:0.22,blue:0.09)]
        case .reptiles:   return [Color(red:0.13,green:0.06,blue:0.02), Color(red:0.22,green:0.09,blue:0.03)]
        case .birds:      return [Color(red:0.02,green:0.06,blue:0.16), Color(red:0.06,green:0.12,blue:0.27)]
        case .fish:       return [Color(red:0.01,green:0.07,blue:0.07), Color(red:0.04,green:0.19,blue:0.19)]
        case .insects:    return [Color(red:0.07,green:0.06,blue:0.00), Color(red:0.14,green:0.13,blue:0.01)]
        case .amphibians: return [Color(red:0.06,green:0.03,blue:0.11), Color(red:0.11,green:0.05,blue:0.22)]
        }
    }
}

// MARK: - Region

enum WorldRegion: String, CaseIterable, Identifiable {
    case africa, asia, northAmerica, southAmerica, europe, oceania
    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .africa:       return "Africa"
        case .asia:         return "Asia"
        case .northAmerica: return "North America"
        case .southAmerica: return "South America"
        case .europe:       return "Europe"
        case .oceania:      return "Oceania"
        }
    }

    var emoji: String {
        switch self {
        case .africa, .europe:              return "🌍"
        case .northAmerica, .southAmerica:  return "🌎"
        case .asia, .oceania:               return "🌏"
        }
    }

    var coordinate: CLLocationCoordinate2D {
        switch self {
        case .africa:       return CLLocationCoordinate2D(latitude:   5.0, longitude:  22.0)
        case .asia:         return CLLocationCoordinate2D(latitude:  34.0, longitude: 100.0)
        case .northAmerica: return CLLocationCoordinate2D(latitude:  45.0, longitude: -95.0)
        case .southAmerica: return CLLocationCoordinate2D(latitude: -15.0, longitude: -60.0)
        case .europe:       return CLLocationCoordinate2D(latitude:  51.0, longitude:  10.0)
        case .oceania:      return CLLocationCoordinate2D(latitude: -25.0, longitude: 134.0)
        }
    }

    var latDelta: Double {
        switch self {
        case .europe: return 35
        case .southAmerica: return 55
        default: return 65
        }
    }
}

// MARK: - Conservation Status

enum ConservationStatus: String, CaseIterable {
    case leastConcern        = "Least Concern"
    case nearThreatened      = "Near Threatened"
    case vulnerable          = "Vulnerable"
    case endangered          = "Endangered"
    case criticallyEndangered = "Critically Endangered"

    var shortCode: String {
        switch self {
        case .leastConcern:        return "LC"
        case .nearThreatened:      return "NT"
        case .vulnerable:          return "VU"
        case .endangered:          return "EN"
        case .criticallyEndangered: return "CR"
        }
    }

    var color: Color {
        switch self {
        case .leastConcern:        return Color(red: 0.20, green: 0.68, blue: 0.20)
        case .nearThreatened:      return Color(red: 0.56, green: 0.78, blue: 0.20)
        case .vulnerable:          return Color(red: 0.88, green: 0.70, blue: 0.10)
        case .endangered:          return Color(red: 0.88, green: 0.44, blue: 0.10)
        case .criticallyEndangered: return Color(red: 0.88, green: 0.17, blue: 0.17)
        }
    }
}

// MARK: - Animal

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let scientific: String
    let emoji: String
    let category: AnimalCategory
    let region: WorldRegion
    let status: ConservationStatus
    let description: String
    let facts: [String]
    let wikipediaTitle: String
    let habitatName: String
    let habitatLat: Double
    let habitatLon: Double

    var habitatCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: habitatLat, longitude: habitatLon)
    }

    var wikipediaAPIURL: URL? {
        let encoded = wikipediaTitle
            .addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? wikipediaTitle
        return URL(string: "https://en.wikipedia.org/api/rest_v1/page/summary/\(encoded)")
    }
}

// MARK: - Wiki Image Loader

@MainActor
class WikiImageLoader: ObservableObject {
    @Published var imageURL: URL?
    @Published var isLoading = false
    private static var cache: [String: URL] = [:]

    func load(title: String) {
        if let cached = WikiImageLoader.cache[title] {
            imageURL = cached
            return
        }
        guard let apiURL = URL(string:
            "https://en.wikipedia.org/api/rest_v1/page/summary/\(title.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? title)"
        ) else { return }

        isLoading = true
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: apiURL)
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let thumb = json["originalimage"] as? [String: Any] ?? json["thumbnail"] as? [String: Any],
                   let src = thumb["source"] as? String,
                   let url = URL(string: src) {
                    WikiImageLoader.cache[title] = url
                    imageURL = url
                }
            } catch {}
            isLoading = false
        }
    }
}
