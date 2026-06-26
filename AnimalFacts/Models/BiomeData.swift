import Foundation
import MapKit

struct Biome: Identifiable {
    let id = UUID()
    let name: String
    let emoji: String
    let description: String
    let climate: String
    let keyFacts: [String]
    let wikipediaTitle: String
    let centerLat: Double
    let centerLon: Double
    let zoomDelta: Double
    let streetViewLat: Double
    let streetViewLon: Double
    let animalRegions: [WorldRegion]
    let animalCategories: [AnimalCategory]

    var centerCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: centerLat, longitude: centerLon)
    }
    var streetViewCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: streetViewLat, longitude: streetViewLon)
    }
    var googleMapsURL: URL? {
        URL(string: "comgooglemaps://?cbll=\(streetViewLat),\(streetViewLon)&maptype=satellite")
    }
    var googleMapsWebURL: URL? {
        URL(string: "https://maps.google.com/maps?q=\(centerLat),\(centerLon)&t=k&z=12")
    }
}

let allBiomes: [Biome] = [
    Biome(
        name: "African Savanna",
        emoji: "🌾",
        description: "A vast sea of golden grassland dotted with acacia trees, home to the greatest concentration of large mammals on Earth. The annual wildebeest migration here is the largest animal movement on the planet.",
        climate: "Tropical wet/dry — hot year-round with distinct wet and dry seasons",
        keyFacts: [
            "Covers about 20% of Africa — 5 million km²",
            "Home to the famous 'Big Five': lion, elephant, buffalo, leopard, rhino",
            "Annual wildebeest migration — 1.5 million animals move 800 km",
            "Acacia trees have evolved thorns and bitter leaves to deter browsers",
            "Fire is essential — burns prevent forest takeover and renew grasses"
        ],
        wikipediaTitle: "East_African_savanna",
        centerLat: -2.33, centerLon: 34.83,
        zoomDelta: 1.5,
        streetViewLat: -1.50, streetViewLon: 35.10,
        animalRegions: [.africa],
        animalCategories: [.mammals, .birds, .reptiles]
    ),
    Biome(
        name: "Amazon Rainforest",
        emoji: "🌿",
        description: "The world's largest tropical rainforest spans 5.5 million km² and contains 10% of all species on Earth. The Amazon River discharges 20% of all fresh water entering the world's oceans.",
        climate: "Tropical rainforest — hot and humid year-round, over 2,000 mm of rain per year",
        keyFacts: [
            "Covers 5.5 million km² across 9 countries",
            "Contains an estimated 10% of all Earth's species",
            "Amazon River discharges 20% of all Earth's river water",
            "Trees 'sweat' water vapour, creating their own rainfall — the 'flying river'",
            "Around 17% has been deforested since the 1970s"
        ],
        wikipediaTitle: "Amazon_rainforest",
        centerLat: -3.10, centerLon: -60.02,
        zoomDelta: 2.0,
        streetViewLat: -3.10, streetViewLon: -60.02,
        animalRegions: [.southAmerica],
        animalCategories: [.mammals, .birds, .reptiles, .amphibians, .insects, .fish]
    ),
    Biome(
        name: "Himalayan Mountains",
        emoji: "🏔️",
        description: "The roof of the world hosts unique high-altitude ecosystems where species have adapted to extreme cold, low oxygen, and intense UV radiation. Snow leopards and red pandas inhabit these magical cloud forests.",
        climate: "Alpine — frigid winters, cool summers; conditions vary dramatically with altitude",
        keyFacts: [
            "Contains 10 of Earth's 14 mountains above 8,000 m",
            "Home to snow leopards, red pandas, and Himalayan brown bears",
            "Cloud forests at mid-elevation host extraordinary biodiversity",
            "Rivers fed by Himalayan glaciers supply water to 2 billion people",
            "Temperatures can drop to −40°C at high altitude in winter"
        ],
        wikipediaTitle: "Himalayas",
        centerLat: 27.98, centerLon: 86.93,
        zoomDelta: 1.0,
        streetViewLat: 27.98, streetViewLon: 86.92,
        animalRegions: [.asia],
        animalCategories: [.mammals, .birds]
    ),
    Biome(
        name: "Australian Outback",
        emoji: "🏜️",
        description: "Australia's vast red interior — an ancient landscape of spinifex grasslands, red sand dunes, and ghost gum trees stretching to every horizon. Marsupials here have evolved in isolation for 30 million years.",
        climate: "Desert and semi-arid — extreme temperature swings, very low and unpredictable rainfall",
        keyFacts: [
            "Covers about 70% of the Australian continent",
            "Can record temperatures from −6°C to +50°C in the same year",
            "Marsupials evolved here in isolation for 30+ million years",
            "Uluru (Ayers Rock) is the world's second largest monolith",
            "The 'dead heart' receives less than 250 mm of rain per year"
        ],
        wikipediaTitle: "Australian_outback",
        centerLat: -25.00, centerLon: 133.00,
        zoomDelta: 2.0,
        streetViewLat: -25.35, streetViewLon: 131.03,
        animalRegions: [.oceania],
        animalCategories: [.mammals, .reptiles, .birds]
    ),
    Biome(
        name: "North American Forests",
        emoji: "🌲",
        description: "From Pacific temperate rainforests to Yellowstone's geothermal wonderland, North American forests harbour grizzly bears, gray wolves, and bald eagles in landscapes shaped by fire, ice, and volcanic activity.",
        climate: "Temperate and boreal — cold winters, warm summers; reliable rainfall year-round",
        keyFacts: [
            "Yellowstone is Earth's largest intact temperate ecosystem",
            "Wolf reintroduction here is the world's most studied trophic cascade",
            "Pacific temperate rainforests receive over 3,500 mm of rain per year",
            "Grizzly bears can consume 20,000 calories in a single day before hibernation",
            "Old-growth trees can be over 1,000 years old"
        ],
        wikipediaTitle: "Temperate_rainforest",
        centerLat: 44.43, centerLon: -110.59,
        zoomDelta: 1.2,
        streetViewLat: 44.46, streetViewLon: -110.83,
        animalRegions: [.northAmerica],
        animalCategories: [.mammals, .birds, .fish]
    ),
    Biome(
        name: "European Woodlands",
        emoji: "🍂",
        description: "Ancient deciduous forests once covered most of Europe. Remnants in the Black Forest, Bavarian Forest, and Białowieża preserve the last echoes of a primal wilderness that shaped human civilisation.",
        climate: "Temperate oceanic — mild and wet, four distinct seasons",
        keyFacts: [
            "Białowieża in Poland is Europe's last primeval lowland forest",
            "Home to Europe's largest land animal, the European bison",
            "Fungi below forest floors link trees in a nutrient-sharing network",
            "Brown bears are slowly returning to the Alps after centuries away",
            "Stag beetles have larvae that develop underground for up to 7 years"
        ],
        wikipediaTitle: "Temperate_deciduous_forest",
        centerLat: 48.00, centerLon: 8.20,
        zoomDelta: 0.8,
        streetViewLat: 48.00, streetViewLon: 8.20,
        animalRegions: [.europe],
        animalCategories: [.mammals, .birds, .insects, .amphibians, .reptiles]
    ),
    Biome(
        name: "South American Wetlands",
        emoji: "💧",
        description: "The Pantanal is the world's largest tropical wetland, flooding seasonally to create an extraordinary mosaic of rivers, lagoons, and flooded forests teeming with wildlife.",
        climate: "Tropical wet/dry — hot year-round with a dramatic annual flood cycle",
        keyFacts: [
            "World's largest tropical wetland — 150,000–195,000 km²",
            "150,000–195,000 km² flood during the wet season",
            "Hosts the world's densest jaguar population",
            "Over 650 bird species recorded — more than all of Europe",
            "Giant otters, giant anteaters, and capybaras all thrive here"
        ],
        wikipediaTitle: "Pantanal",
        centerLat: -16.50, centerLon: -56.00,
        zoomDelta: 1.5,
        streetViewLat: -16.50, streetViewLon: -56.00,
        animalRegions: [.southAmerica],
        animalCategories: [.mammals, .birds, .reptiles, .fish]
    ),
    Biome(
        name: "Great Barrier Reef",
        emoji: "🐠",
        description: "The largest living structure on Earth and the only one visible from space, the Great Barrier Reef comprises 2,900 individual reefs and hosts over 1,500 species of fish in a single interconnected ecosystem.",
        climate: "Tropical marine — warm, clear water year-round between 23–29°C",
        keyFacts: [
            "Largest living structure on Earth — visible from space",
            "Over 2,900 individual reefs and 900 islands",
            "Home to 1,500 species of fish, 4,000 types of mollusc",
            "Coral bleaching events now occur 5× more frequently than in the 1980s",
            "Estimated economic value of AUD $6.4 billion per year to Australia"
        ],
        wikipediaTitle: "Great_Barrier_Reef",
        centerLat: -18.29, centerLon: 147.70,
        zoomDelta: 1.5,
        streetViewLat: -18.29, streetViewLon: 147.70,
        animalRegions: [.oceania],
        animalCategories: [.fish, .reptiles]
    ),
    Biome(
        name: "Arctic Tundra",
        emoji: "❄️",
        description: "The treeless frozen plains encircling the Arctic Ocean are home to remarkable cold-adapted species that must survive months of polar darkness and temperatures dropping below −50°C.",
        climate: "Arctic — extremely cold winters (to −50°C), short cool summers, very little precipitation",
        keyFacts: [
            "Permafrost underlies the entire biome — ground frozen year-round",
            "Arctic summer brings continuous daylight for weeks",
            "Arctic warming is occurring 4× faster than the global average",
            "Polar bear sea ice habitat has declined 13% per decade since 1979",
            "Lemmings cycle in dramatic boom-bust populations every 3–4 years"
        ],
        wikipediaTitle: "Arctic_tundra",
        centerLat: 71.30, centerLon: -156.75,
        zoomDelta: 1.5,
        streetViewLat: 71.30, streetViewLon: -156.75,
        animalRegions: [.northAmerica],
        animalCategories: [.mammals, .birds]
    ),
    Biome(
        name: "Southeast Asian Jungle",
        emoji: "🌴",
        description: "Borneo and Sumatra harbour some of Earth's most ancient rainforests, unchanged for 130 million years — twice as old as the Amazon — and home to orangutans, proboscis monkeys, and Komodo dragons.",
        climate: "Tropical rainforest — consistently hot (26–32°C), with over 3,000 mm of rain per year",
        keyFacts: [
            "Borneo's rainforest is up to 130 million years old — Earth's oldest",
            "Contains 6% of Earth's biodiversity in 1% of land area",
            "Rafflesia — world's largest flower — blooms here for just 5 days",
            "Over 400 bird species on Borneo alone",
            "Deforestation for palm oil has reduced orangutan habitat by 80%"
        ],
        wikipediaTitle: "Borneo_lowland_rain_forests",
        centerLat: 4.62, centerLon: 117.62,
        zoomDelta: 1.0,
        streetViewLat: 4.62, streetViewLon: 117.62,
        animalRegions: [.asia],
        animalCategories: [.mammals, .reptiles, .birds, .amphibians, .insects]
    )
]
