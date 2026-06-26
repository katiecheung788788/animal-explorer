# Animal Facts — iOS App

An iOS app built in SwiftUI, based on the Animal Explorer web app, with Google Maps walkthrough,
real Wikipedia animal photos, photorealistic satellite world map, and 60 animals across 6 continents.

## Features

- **60 animals** across Africa, Asia, North America, South America, Europe, and Oceania
- **Real Wikipedia photos** — every animal image is loaded from Wikipedia's REST API (guaranteed correct, free)
- **Photorealistic satellite world map** — MapKit with `imagery(elevation: .realistic)` mode
- **Animal pins on world map** — tap any pin to open the animal detail view
- **Google Maps walkthrough** on every biome and animal:
  - "Google Maps" button → opens the habitat in Google Maps satellite view
  - "Street View" button → deep-links to Google Maps Street View at the habitat
  - "Look Around" button → Apple's built-in street-level imagery (where available)
- **10 biomes** to explore: African Savanna, Amazon Rainforest, Himalayas, Australian Outback, North American Forests, European Woodlands, South American Wetlands, Great Barrier Reef, Arctic Tundra, Southeast Asian Jungle
- **Discovery tracking** — checkmark + progress bar as you explore animals
- **Category & region filters** + live search
- **Conservation status** badges (LC / NT / VU / EN / CR) with colour coding

## Requirements

- Xcode 15 or later
- iOS 17.0+ deployment target (for MapKit `Map(initialPosition:)` API + Look Around)
- No API keys required — Wikipedia image API and MapKit are free/built-in
- **Optional**: Install Google Maps on the test device to enable deep-link walkthrough

## Setup in Xcode

1. Open Xcode → **File → New → Project**
2. Choose **iOS → App**, click Next
3. Set:
   - Product Name: `AnimalFacts`
   - Bundle Identifier: `com.yourname.AnimalFacts`
   - Interface: **SwiftUI**
   - Language: **Swift**
   - Minimum Deployments: **iOS 17.0**
4. Save the project anywhere, then **delete** all auto-generated Swift files
5. **Drag and drop** the entire `AnimalFacts/` folder from this repo into the Xcode project navigator
6. When prompted, select **"Copy items if needed"** and **"Create groups"**
7. In **Info.plist**, add the key:
   ```
   LSApplicationQueriesSchemes → Array → Item 0: comgooglemaps
   ```
   (this lets the app detect whether Google Maps is installed)
8. Press **⌘R** to build and run

## Project Structure

```
AnimalFacts/
├── AnimalFactsApp.swift          — App entry point
├── ContentView.swift             — TabView container (Explore / World Map / Biomes)
├── Models/
│   ├── Animal.swift              — Animal model, enums, WikiImageLoader
│   ├── AnimalData.swift          — All 60 animals with facts and habitat coordinates
│   └── BiomeData.swift           — 10 biomes with map coordinates and key facts
├── ViewModels/
│   └── AnimalViewModel.swift     — State: filtering, search, discovery tracking
└── Views/
    ├── AnimalImageView.swift      — Shared image component (Wikipedia photo + emoji fallback)
    ├── AnimalCardView.swift       — Grid card component
    ├── ExploreView.swift          — Animal grid with search and filters
    ├── AnimalDetailView.swift     — Full detail: photo, facts, habitat map, walkthrough
    ├── WorldMapView.swift         — Global satellite map with animal pins
    └── BiomeWalkthroughView.swift — Biome list, detail, and walkthrough buttons
```

## Google Maps Deep Links

The app uses URL scheme deep links — no Google Maps SDK or API key required:

| Action | URL |
|--------|-----|
| Satellite view | `comgooglemaps://?center=LAT,LON&zoom=12&maptype=satellite` |
| Street View | `comgooglemaps://?cbll=LAT,LON&maptype=streetview` |
| Web fallback | `https://maps.google.com/maps?q=LAT,LON&t=k` |

If Google Maps is not installed, the app falls back to opening maps.google.com in Safari.
