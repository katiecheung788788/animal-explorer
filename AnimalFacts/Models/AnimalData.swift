import Foundation

// MARK: - All 60 animals across 6 continents (10 per region)

let allAnimals: [Animal] = [

    // ─── AFRICA ──────────────────────────────────────────────────────────────

    Animal(name: "African Elephant", scientific: "Loxodonta africana", emoji: "🐘",
           category: .mammals, region: .africa, status: .vulnerable,
           description: "The largest land animal on Earth, living in matriarch-led herds renowned for their extraordinary memory, deep family bonds, and complex emotional lives.",
           facts: [
               "Largest land animal — up to 6 tonnes and 3.3 m at the shoulder",
               "Trunks have over 40,000 muscles and can lift 350 kg",
               "Communicate via infrasound too low for humans to hear, felt up to 10 km away",
               "Grieve their dead and revisit the bones of family members",
               "Drink up to 200 litres of water per day"
           ],
           wikipediaTitle: "African_bush_elephant",
           habitatName: "Amboseli Savanna, Kenya",
           habitatLat: -2.64, habitatLon: 37.26),

    Animal(name: "Lion", scientific: "Panthera leo", emoji: "🦁",
           category: .mammals, region: .africa, status: .vulnerable,
           description: "The only cats that live in social groups, lions rule the African savannah in cooperative prides where females do most of the hunting.",
           facts: [
               "Only cats that naturally live in groups called prides",
               "A roar can be heard from 8 kilometres away",
               "Females do 85–90% of all hunting in a pride",
               "Sleep up to 20 hours a day to conserve energy",
               "A male's mane darkens with age, signalling fitness and dominance"
           ],
           wikipediaTitle: "Lion",
           habitatName: "Masai Mara, Kenya",
           habitatLat: -1.50, habitatLon: 35.10),

    Animal(name: "Cheetah", scientific: "Acinonyx jubatus", emoji: "🐆",
           category: .mammals, region: .africa, status: .vulnerable,
           description: "The fastest land animal alive reaches 112 km/h in explosive sprints and sacrifices strength for speed — making it unusual among big cats.",
           facts: [
               "Fastest land animal — bursts up to 112 km/h in under 3 seconds",
               "Non-retractable claws grip the ground like running spikes",
               "Cannot roar — instead chirps, purrs and yelps",
               "Only big cat active primarily in daylight hours",
               "Loses up to 50% of kills to stronger predators"
           ],
           wikipediaTitle: "Cheetah",
           habitatName: "Serengeti, Tanzania",
           habitatLat: -2.33, habitatLon: 34.83),

    Animal(name: "Giraffe", scientific: "Giraffa camelopardalis", emoji: "🦒",
           category: .mammals, region: .africa, status: .vulnerable,
           description: "The world's tallest animal uses its extraordinary neck not only to browse treetops but also to deliver devastating kicks and engage in 'necking' battles.",
           facts: [
               "Tallest animal on Earth — up to 5.7 m high",
               "Heart weighs 11 kg and beats 170 times per minute",
               "A single kick can kill a lion",
               "Sleeps only 20 minutes a day in short 5-minute bursts",
               "No two giraffes share the same spot pattern"
           ],
           wikipediaTitle: "Giraffe",
           habitatName: "Amboseli National Park, Kenya",
           habitatLat: -2.71, habitatLon: 37.35),

    Animal(name: "Mountain Gorilla", scientific: "Gorilla beringei beringei", emoji: "🦍",
           category: .mammals, region: .africa, status: .endangered,
           description: "One of our closest relatives, mountain gorillas live in tight family groups in the misty volcanic highlands of central Africa — a remarkable conservation success story.",
           facts: [
               "Share 98.3% of human DNA",
               "A silverback's chest beat can be heard 1 km away",
               "Populations have actually grown thanks to intensive conservation",
               "Build a fresh nest of branches to sleep in every single night",
               "Eat up to 34 kg of vegetation per day"
           ],
           wikipediaTitle: "Mountain_gorilla",
           habitatName: "Virunga Mountains, Rwanda",
           habitatLat: -1.48, habitatLon: 29.52),

    Animal(name: "Hippopotamus", scientific: "Hippopotamus amphibius", emoji: "🦛",
           category: .mammals, region: .africa, status: .vulnerable,
           description: "Despite their plant-eating diet and seemingly slow nature, hippos are the most dangerous large land animal in Africa — fiercely territorial and surprisingly fast on land.",
           facts: [
               "Responsible for more human deaths in Africa than any other large animal",
               "Can run at 30 km/h on land — faster than most humans",
               "Skin secretes a natural sunscreen and antibiotic 'blood sweat'",
               "Spend up to 16 hours a day in water to stay cool",
               "Their closest living relatives are whales and dolphins"
           ],
           wikipediaTitle: "Hippopotamus",
           habitatName: "Nile River, Uganda",
           habitatLat: 4.00, habitatLon: 32.50),

    Animal(name: "Nile Crocodile", scientific: "Crocodylus niloticus", emoji: "🐊",
           category: .reptiles, region: .africa, status: .leastConcern,
           description: "Africa's largest predator is virtually unchanged for 200 million years and holds the record for the most powerful bite of any living animal.",
           facts: [
               "Strongest bite force ever recorded in a living animal — 22,000 N",
               "Can hold their breath for up to 2 hours",
               "Females carry hatchlings to water in their mouths",
               "Unchanged for over 200 million years",
               "Can go months without eating after a large kill"
           ],
           wikipediaTitle: "Nile_crocodile",
           habitatName: "Nile Delta, Egypt",
           habitatLat: 24.09, habitatLon: 32.90),

    Animal(name: "Ostrich", scientific: "Struthio camelus", emoji: "🦩",
           category: .birds, region: .africa, status: .leastConcern,
           description: "The world's largest bird cannot fly, but is the fastest two-legged animal on Earth and lays eggs bigger than any other living bird.",
           facts: [
               "Largest and heaviest bird — up to 156 kg",
               "Fastest running bird: sustained 70 km/h over distance",
               "Eyes (5 cm diameter) are larger than their brain",
               "A single egg weighs as much as 24 chicken eggs",
               "Contrary to myth, ostriches do NOT bury their heads in the sand"
           ],
           wikipediaTitle: "Common_ostrich",
           habitatName: "Sahel Savanna, Chad",
           habitatLat: 11.00, habitatLon: 15.00),

    Animal(name: "Goliath Beetle", scientific: "Goliathus goliatus", emoji: "🪲",
           category: .insects, region: .africa, status: .leastConcern,
           description: "One of the heaviest insects alive, found in Central African rainforests where males joust in trees with their formidable Y-shaped horns.",
           facts: [
               "One of the world's heaviest insects — adults up to 100 g",
               "Larvae can weigh 150 g — heavier than the adult",
               "Males use Y-shaped horns to wrestle rivals off branches",
               "Despite their bulk, they are powerful fliers",
               "Feed on rotting wood, tree sap, and fruit"
           ],
           wikipediaTitle: "Goliath_beetle",
           habitatName: "Congo Rainforest, DRC",
           habitatLat: 1.00, habitatLon: 15.00),

    Animal(name: "African Bullfrog", scientific: "Pyxicephalus adspersus", emoji: "🐸",
           category: .amphibians, region: .africa, status: .leastConcern,
           description: "A giant among frogs where males are unusually larger than females, and ferociously protective fathers guard their tadpoles against any predator — even lions.",
           facts: [
               "One of Africa's largest frogs — up to 2.3 kg",
               "Males are bigger than females — rare among amphibians",
               "Survive dry seasons buried in a mucus cocoon underground",
               "Fathers will chase off snakes and even lions from tadpoles",
               "Will eat almost anything: insects, rodents, snakes, other frogs"
           ],
           wikipediaTitle: "African_bullfrog",
           habitatName: "Kalahari, Botswana",
           habitatLat: -20.00, habitatLon: 23.00),

    // ─── ASIA ─────────────────────────────────────────────────────────────────

    Animal(name: "Bengal Tiger", scientific: "Panthera tigris tigris", emoji: "🐅",
           category: .mammals, region: .asia, status: .endangered,
           description: "The national animal of India and Bangladesh, Bengal tigers are solitary apex predators with stripe patterns as unique as human fingerprints.",
           facts: [
               "No two tigers share the same stripe pattern",
               "Excellent swimmers — they actively seek out water to hunt",
               "A roar carries up to 3 km through dense jungle",
               "Saliva has mild antiseptic properties — they lick wounds",
               "A tiger's territory can span over 100 km²"
           ],
           wikipediaTitle: "Bengal_tiger",
           habitatName: "Sundarbans Mangrove, India",
           habitatLat: 21.95, habitatLon: 89.18),

    Animal(name: "Giant Panda", scientific: "Ailuropoda melanoleuca", emoji: "🐼",
           category: .mammals, region: .asia, status: .vulnerable,
           description: "A conservation icon, the giant panda spends up to 16 hours a day eating bamboo to fuel a body not designed for an all-plant diet.",
           facts: [
               "Eat 12–38 kg of bamboo every single day",
               "Have a 'false thumb' — an enlarged wrist bone for gripping bamboo",
               "Wild population has recovered to over 1,800 thanks to conservation",
               "Newborns weigh just 100 g — 1/900th of the mother's weight",
               "Despite their diet, they are classified as carnivores"
           ],
           wikipediaTitle: "Giant_panda",
           habitatName: "Qinling Mountains, China",
           habitatLat: 33.85, habitatLon: 107.60),

    Animal(name: "Snow Leopard", scientific: "Panthera uncia", emoji: "🐱",
           category: .mammals, region: .asia, status: .vulnerable,
           description: "The 'ghost of the mountains' is so elusive that scientists estimate the entire wild population without ever having a complete count.",
           facts: [
               "Tail is nearly as long as their body — used for balance and warmth",
               "Can leap 15 m horizontally and 6 m vertically",
               "Cannot roar — makes a unique 'chuffing' sound called prusten",
               "Paws act as natural snowshoes — broad and well-furred",
               "Estimated 4,000–6,500 left in the wild across 12 countries"
           ],
           wikipediaTitle: "Snow_leopard",
           habitatName: "Himalayas, Nepal",
           habitatLat: 27.90, habitatLon: 86.90),

    Animal(name: "Komodo Dragon", scientific: "Varanus komodoensis", emoji: "🦎",
           category: .reptiles, region: .asia, status: .endangered,
           description: "The world's largest lizard ambushes prey as large as water buffalo using venom that prevents blood clotting — and is found only on five Indonesian islands.",
           facts: [
               "World's largest lizard — up to 3 m and 70 kg",
               "Detects prey from 9 km using a forked tongue and Jacobson's organ",
               "Females can reproduce without males via parthenogenesis",
               "Can eat 80% of their body weight in a single meal",
               "Venom glands prevent prey's blood from clotting"
           ],
           wikipediaTitle: "Komodo_dragon",
           habitatName: "Komodo Island, Indonesia",
           habitatLat: -8.55, habitatLon: 119.48),

    Animal(name: "Red Panda", scientific: "Ailurus fulgens", emoji: "🐾",
           category: .mammals, region: .asia, status: .endangered,
           description: "Unrelated to the giant panda, the red panda is the sole member of its own family — a secretive, tree-dwelling mammal of the eastern Himalayas.",
           facts: [
               "Not related to the giant panda — a family of its own",
               "Has a false thumb (extended wrist bone) for gripping bamboo",
               "Spends most of its life high in trees",
               "Uses its long bushy tail as a blanket in cold weather",
               "Active at dawn and dusk; sleeps curled up in trees by day"
           ],
           wikipediaTitle: "Red_panda",
           habitatName: "Eastern Himalayas, Nepal",
           habitatLat: 27.50, habitatLon: 88.50),

    Animal(name: "King Cobra", scientific: "Ophiophagus hannah", emoji: "🐍",
           category: .reptiles, region: .asia, status: .vulnerable,
           description: "The world's longest venomous snake can raise a third of its body off the ground and look a human in the eye — its Latin name means 'snake-eater'.",
           facts: [
               "World's longest venomous snake — up to 5.5 m",
               "Feeds almost entirely on other snakes, including pythons",
               "One bite delivers enough venom to kill an elephant",
               "The only snake species that builds a nest for its eggs",
               "Can raise a third of its body off the ground when threatened"
           ],
           wikipediaTitle: "King_cobra",
           habitatName: "Western Ghats, India",
           habitatLat: 11.00, habitatLon: 76.00),

    Animal(name: "Japanese Macaque", scientific: "Macaca fuscata", emoji: "🐒",
           category: .mammals, region: .asia, status: .leastConcern,
           description: "Snow monkeys are the world's most northerly non-human primates, famous for bathing in volcanic hot springs and passing unique cultural behaviours across generations.",
           facts: [
               "Most northerly non-human primate on Earth",
               "Bathe in volcanic hot springs during snowy winters",
               "Wash food before eating — a learned cultural behaviour",
               "Troops develop unique local traditions passed down through generations",
               "Red faces intensify in colour during excitement or cold"
           ],
           wikipediaTitle: "Japanese_macaque",
           habitatName: "Jigokudani, Nagano, Japan",
           habitatLat: 36.74, habitatLon: 138.20),

    Animal(name: "Proboscis Monkey", scientific: "Nasalis larvatus", emoji: "🐒",
           category: .mammals, region: .asia, status: .endangered,
           description: "Found only in Borneo's mangrove forests, the proboscis monkey is famous for its enormous pendulous nose, which amplifies calls to attract mates.",
           facts: [
               "Endemic to Borneo — found nowhere else on Earth",
               "A male's nose can grow over 10 cm long",
               "The large nose amplifies calls and helps regulate body temperature",
               "Excellent swimmers — can swim hundreds of metres across rivers",
               "Population has declined 50% in the last 40 years"
           ],
           wikipediaTitle: "Proboscis_monkey",
           habitatName: "Kinabatangan River, Borneo",
           habitatLat: 5.41, habitatLon: 118.01),

    Animal(name: "Asian Elephant", scientific: "Elephas maximus", emoji: "🐘",
           category: .mammals, region: .asia, status: .endangered,
           description: "The largest land animal in Asia is critically important to forest ecosystems and has been revered in culture, religion, and warfare for thousands of years.",
           facts: [
               "Smaller ears than African elephants — shaped like the Indian subcontinent",
               "Only some males grow tusks — unlike African elephants where both do",
               "Have been domesticated for over 4,000 years",
               "Memory is exceptional — recognise hundreds of individuals over decades",
               "A keystone species that creates clearings enabling forest regeneration"
           ],
           wikipediaTitle: "Asian_elephant",
           habitatName: "Minneriya, Sri Lanka",
           habitatLat: 7.97, habitatLon: 80.82),

    Animal(name: "Chinese Giant Salamander", scientific: "Andrias davidianus", emoji: "🫧",
           category: .amphibians, region: .asia, status: .criticallyEndangered,
           description: "The world's largest amphibian is a living fossil virtually unchanged for 170 million years, now critically endangered due to hunting and habitat loss.",
           facts: [
               "World's largest amphibian — up to 1.8 m and 50 kg",
               "Can live for over 60 years",
               "Nearly blind; hunts by sensing water vibrations through skin",
               "Exudes a sticky, pepper-scented secretion as defence",
               "Virtually unchanged for 170 million years"
           ],
           wikipediaTitle: "Chinese_giant_salamander",
           habitatName: "Yangtze River, China",
           habitatLat: 30.60, habitatLon: 114.30),

    // ─── NORTH AMERICA ────────────────────────────────────────────────────────

    Animal(name: "Grizzly Bear", scientific: "Ursus arctos horribilis", emoji: "🐻",
           category: .mammals, region: .northAmerica, status: .leastConcern,
           description: "One of North America's most powerful animals, grizzlies are surprisingly gentle omnivores — up to 80% of their diet is plants, berries, and insects.",
           facts: [
               "Can smell food from over 29 km away",
               "Run at 55 km/h — faster than a racehorse over short distances",
               "Shoulder hump is solid muscle used for powerful digging",
               "Eat 20,000 calories a day before winter hibernation",
               "80% of their diet is plants, berries, and insects"
           ],
           wikipediaTitle: "Grizzly_bear",
           habitatName: "Yellowstone National Park, USA",
           habitatLat: 44.43, habitatLon: -110.59),

    Animal(name: "American Alligator", scientific: "Alligator mississippiensis", emoji: "🐊",
           category: .reptiles, region: .northAmerica, status: .leastConcern,
           description: "A conservation triumph: once nearly hunted to extinction, strict protections have revived populations to over 1 million across the southeastern United States.",
           facts: [
               "Recovered from near-extinction — a landmark conservation success",
               "Nest temperature determines the sex of every hatchling",
               "Females carry hatchlings to water in their mouths",
               "Surprisingly agile on land and can sprint short distances",
               "Bite force exceeds that of a lion or tiger"
           ],
           wikipediaTitle: "American_alligator",
           habitatName: "Everglades, Florida, USA",
           habitatLat: 25.51, habitatLon: -80.93),

    Animal(name: "Bald Eagle", scientific: "Haliaeetus leucocephalus", emoji: "🦅",
           category: .birds, region: .northAmerica, status: .leastConcern,
           description: "The national symbol of the United States was rescued from the brink of extinction and is now one of history's greatest conservation success stories.",
           facts: [
               "Wingspan can reach 2.4 metres",
               "Can spot prey from over 3 km away",
               "Mate for life and return to the same nest every year",
               "Nests can weigh over a tonne after decades of additions",
               "Named from Old English 'balde' meaning white-headed"
           ],
           wikipediaTitle: "Bald_eagle",
           habitatName: "Inside Passage, Alaska, USA",
           habitatLat: 58.30, habitatLon: -134.42),

    Animal(name: "Monarch Butterfly", scientific: "Danaus plexippus", emoji: "🦋",
           category: .insects, region: .northAmerica, status: .endangered,
           description: "Monarchs perform one of Earth's great migrations — flying up to 4,800 km from Canada to Mexican mountains, navigating by a sun compass in their antennae.",
           facts: [
               "Migrates up to 4,800 km from Canada to central Mexico",
               "Navigates using a time-compensated sun compass in antennae",
               "Milkweed toxins in their diet make them poisonous to birds",
               "A complete migration cycle takes 3–4 generations of butterflies",
               "Populations have declined over 80% in recent decades"
           ],
           wikipediaTitle: "Monarch_butterfly",
           habitatName: "Monarch Butterfly Reserve, Michoacán",
           habitatLat: 19.62, habitatLon: -100.25),

    Animal(name: "American Bison", scientific: "Bison bison", emoji: "🦬",
           category: .mammals, region: .northAmerica, status: .nearThreatened,
           description: "Once numbering 60 million and roaming in herds so vast they shook the ground, American bison were nearly wiped out and are now the USA's national mammal.",
           facts: [
               "Once roamed in herds 60 million strong across North America",
               "Reduced to fewer than 1,000 animals by 1890 — now 500,000",
               "Can run at 65 km/h despite weighing up to 900 kg",
               "Despite their bulk, can jump fences over 1.5 m high",
               "Essential to Great Plains ecosystems — their wallows create wetlands"
           ],
           wikipediaTitle: "American_bison",
           habitatName: "Badlands, South Dakota, USA",
           habitatLat: 43.75, habitatLon: -102.49),

    Animal(name: "Gray Wolf", scientific: "Canis lupus", emoji: "🐺",
           category: .mammals, region: .northAmerica, status: .leastConcern,
           description: "The apex predator whose reintroduction to Yellowstone sparked a trophic cascade that literally changed the course of rivers — demonstrating the power of keystone species.",
           facts: [
               "Their Yellowstone reintroduction reshaped entire river systems",
               "Pack territories can span up to 1,000 km²",
               "Howls can be heard from 16 km away in open terrain",
               "Mate for life; both parents raise pups",
               "Can travel 200 km in a single day when tracking prey"
           ],
           wikipediaTitle: "Gray_wolf",
           habitatName: "Yellowstone National Park, USA",
           habitatLat: 44.80, habitatLon: -110.55),

    Animal(name: "Great White Shark", scientific: "Carcharodon carcharias", emoji: "🦈",
           category: .fish, region: .northAmerica, status: .vulnerable,
           description: "The ocean's most iconic apex predator is more threatened by humans than the reverse — crucial to marine ecosystem balance and far less dangerous than portrayed.",
           facts: [
               "Can detect blood diluted to 1 part per 10 million parts of water",
               "Skin is covered in tooth-like scales called denticles",
               "Can live for over 70 years — much longer than once thought",
               "Can leap completely out of the water when attacking from below",
               "Has 5–7 rows of teeth; a lost tooth regrows within days"
           ],
           wikipediaTitle: "Great_white_shark",
           habitatName: "Farallon Islands, California",
           habitatLat: 37.70, habitatLon: -123.00),

    Animal(name: "American Bullfrog", scientific: "Lithobates catesbeianus", emoji: "🐸",
           category: .amphibians, region: .northAmerica, status: .leastConcern,
           description: "North America's largest native frog is a voracious predator that will eat almost anything — other frogs, snakes, small birds, even bats.",
           facts: [
               "Largest frog in North America — up to 20 cm snout to vent",
               "Call carries up to 1 km on a still night",
               "Tadpoles take up to 2 full years to metamorphose",
               "Now a destructive invasive species on 4 continents",
               "Will attempt to swallow prey nearly half their own body size"
           ],
           wikipediaTitle: "American_bullfrog",
           habitatName: "Mississippi Delta, Louisiana",
           habitatLat: 29.95, habitatLon: -90.07),

    Animal(name: "California Condor", scientific: "Gymnogyps californianus", emoji: "🦅",
           category: .birds, region: .northAmerica, status: .criticallyEndangered,
           description: "North America's largest land bird was reduced to just 27 individuals in 1987, making it the subject of the most intensive captive-breeding programme in history.",
           facts: [
               "Wingspan of 3 m — largest of any North American land bird",
               "Reduced to just 27 birds in 1987; now over 500",
               "Can soar for hours without a single wingbeat using thermals",
               "Lifespan of 60 years — one of the longest-lived birds",
               "Soar to altitudes of 4,600 m while foraging"
           ],
           wikipediaTitle: "California_condor",
           habitatName: "Grand Canyon, Arizona",
           habitatLat: 36.10, habitatLon: -112.10),

    Animal(name: "Wolverine", scientific: "Gulo gulo", emoji: "🦡",
           category: .mammals, region: .northAmerica, status: .leastConcern,
           description: "The largest land-dwelling member of the weasel family is pound for pound one of nature's most ferocious animals, known to drive grizzly bears from their kills.",
           facts: [
               "Pound for pound, one of the most ferocious animals alive",
               "Known to drive grizzly bears and mountain lions from kills",
               "Travel up to 45 km per day through deep snow",
               "Semi-retractable claws act as crampons on ice",
               "Scent glands produce a smell so powerful it earned the name 'skunk bear'"
           ],
           wikipediaTitle: "Wolverine_(animal)",
           habitatName: "Glacier National Park, Montana",
           habitatLat: 48.50, habitatLon: -113.60),

    // ─── SOUTH AMERICA ────────────────────────────────────────────────────────

    Animal(name: "Jaguar", scientific: "Panthera onca", emoji: "🐆",
           category: .mammals, region: .southAmerica, status: .nearThreatened,
           description: "The Americas' largest cat kills with a unique crushing bite directly to the skull, and unlike most big cats is an enthusiastic swimmer that actively hunts in rivers.",
           facts: [
               "Strongest bite of any big cat relative to body size",
               "Kills with a crushing bite directly to the skull — a unique technique",
               "Excellent swimmers that actively hunt caimans and fish",
               "Rosette spots contain smaller inner spots, unlike leopards",
               "Sacred in many Mesoamerican cultures as a symbol of power"
           ],
           wikipediaTitle: "Jaguar",
           habitatName: "Amazon Basin, Brazil",
           habitatLat: 3.00, habitatLon: -63.00),

    Animal(name: "Green Anaconda", scientific: "Eunectes murinus", emoji: "🐍",
           category: .reptiles, region: .southAmerica, status: .leastConcern,
           description: "The world's heaviest snake lurks in South American swamps, ambushing prey as large as caimans and tapirs, killing entirely by constriction.",
           facts: [
               "World's heaviest snake — over 250 kg and up to 8 m long",
               "Can go over a year without eating after a large meal",
               "Gives birth to live young — up to 40 at once",
               "Eyes and nostrils sit atop the head for aquatic ambush",
               "Not venomous — kills entirely by constriction"
           ],
           wikipediaTitle: "Green_anaconda",
           habitatName: "Llanos Wetlands, Venezuela",
           habitatLat: -5.00, habitatLon: -60.00),

    Animal(name: "Capybara", scientific: "Hydrochoerus hydrochaeris", emoji: "🐾",
           category: .mammals, region: .southAmerica, status: .leastConcern,
           description: "The world's largest rodent is a remarkably sociable semi-aquatic mammal and a natural 'host' species — birds, monkeys, and caimans often rest on their calm backs.",
           facts: [
               "World's largest rodent — up to 66 kg",
               "Highly sociable — live in groups of 10 to 100",
               "Semi-aquatic: webbed toes, nostrils on top of snout",
               "Can hold their breath for up to 5 minutes",
               "Acts as a natural host for birds and other animals who hitch rides"
           ],
           wikipediaTitle: "Capybara",
           habitatName: "Pantanal, Brazil",
           habitatLat: -16.00, habitatLon: -57.00),

    Animal(name: "Giant Anteater", scientific: "Myrmecophaga tridactyla", emoji: "🐜",
           category: .mammals, region: .southAmerica, status: .vulnerable,
           description: "The giant anteater has no teeth, no ability to fight most predators, and yet manages to consume 35,000 ants and termites per day with its extraordinary 60 cm tongue.",
           facts: [
               "60 cm tongue flicks in and out 150 times per minute",
               "No teeth — grinds insects with a tough muscular stomach",
               "Eats 35,000 ants and termites every single day",
               "Claws so powerful it must walk on its knuckles",
               "Carries its young on its back for up to a year"
           ],
           wikipediaTitle: "Giant_anteater",
           habitatName: "Cerrado, Brazil",
           habitatLat: -15.00, habitatLon: -49.00),

    Animal(name: "Scarlet Macaw", scientific: "Ara macao", emoji: "🦜",
           category: .birds, region: .southAmerica, status: .leastConcern,
           description: "One of the world's most brilliantly coloured birds, scarlet macaws form lifelong pair bonds and are so devoted they are rarely seen more than a metre from their mate.",
           facts: [
               "Can live up to 75 years in captivity",
               "Mate for life and are almost never seen alone",
               "Powerful beaks can crack the hardest tropical nuts",
               "Can mimic human speech with surprising clarity",
               "Bright colours come from carotenoid pigments in their diet"
           ],
           wikipediaTitle: "Scarlet_macaw",
           habitatName: "Amazon Rainforest, Peru",
           habitatLat: -5.00, habitatLon: -65.00),

    Animal(name: "Harpy Eagle", scientific: "Harpia harpyja", emoji: "🦅",
           category: .birds, region: .southAmerica, status: .vulnerable,
           description: "The harpy eagle is the most powerful bird of prey in the Americas, with talons larger than a grizzly bear's claws and the ability to snatch monkeys from the canopy.",
           facts: [
               "Talons longer than a grizzly bear's claws — up to 13 cm",
               "Can fly at 80 km/h between dense rainforest trees",
               "Preferred prey is sloths and monkeys seized from the canopy",
               "A pair raises only one chick every 2–3 years",
               "One of the largest eagles in the world by mass"
           ],
           wikipediaTitle: "Harpy_eagle",
           habitatName: "Amazon Canopy, Brazil",
           habitatLat: -2.00, habitatLon: -56.00),

    Animal(name: "Poison Dart Frog", scientific: "Dendrobates tinctorius", emoji: "🐸",
           category: .amphibians, region: .southAmerica, status: .leastConcern,
           description: "Among the most toxic animals alive, yet tiny — often under 3 cm. Their vivid colours warn predators, and captive-bred frogs raised on different diets are completely harmless.",
           facts: [
               "Some species carry enough toxin to kill 10 adult humans",
               "Bright colours (aposematism) serve as a warning to predators",
               "Toxins come entirely from the wild insects they eat",
               "Indigenous peoples used skin secretions to poison blow-darts",
               "Captive-bred frogs raised on alternative diets are non-toxic"
           ],
           wikipediaTitle: "Poison_dart_frog",
           habitatName: "Colombian Pacific Rainforest",
           habitatLat: 5.00, habitatLon: -76.00),

    Animal(name: "Blue Morpho Butterfly", scientific: "Morpho peleides", emoji: "🦋",
           category: .insects, region: .southAmerica, status: .leastConcern,
           description: "The blue morpho's spectacular wings produce colour not through pigment but through microscopic nanostructures that diffract light into vivid, shimmering iridescence.",
           facts: [
               "Wingspan up to 20 cm — among the world's largest butterflies",
               "Blue colour is structural, produced by nanostructures — not pigment",
               "Wings flash iridescent blue then camouflage brown when flapping",
               "Adults drink juice from rotting fruit, not flower nectar",
               "Caterpillars are surprisingly cannibalistic when crowded"
           ],
           wikipediaTitle: "Blue_morpho_butterfly",
           habitatName: "Costa Rican Rainforest",
           habitatLat: 9.00, habitatLon: -83.00),

    Animal(name: "Red-bellied Piranha", scientific: "Pygocentrus nattereri", emoji: "🐟",
           category: .fish, region: .southAmerica, status: .leastConcern,
           description: "The piranha's man-eating reputation is largely mythology. These fish are vital scavengers in Amazonian ecosystems, though their interlocking teeth are genuinely razor-sharp.",
           facts: [
               "Sharpest teeth of any fish — interlocking triangular blades",
               "Mass human attacks are largely folklore — well-documented cases are rare",
               "Jaws exert 30× more force per body weight than a great white shark",
               "Can detect blood diluted in 200 litres of water",
               "Play a crucial ecological role as river scavengers"
           ],
           wikipediaTitle: "Red-bellied_piranha",
           habitatName: "Amazon River, Brazil",
           habitatLat: -3.00, habitatLon: -60.00),

    Animal(name: "Amazon River Dolphin", scientific: "Inia geoffrensis", emoji: "🐬",
           category: .mammals, region: .southAmerica, status: .endangered,
           description: "The largest freshwater dolphin and the only one naturally pink in colour, the boto navigates flooded Amazonian forests using echolocation sophisticated enough to detect fish hidden in leaf litter.",
           facts: [
               "World's largest river dolphin — up to 2.5 m and 185 kg",
               "Adults are pink due to scar tissue from social interactions",
               "Echolocation can detect objects behind and beneath obstacles",
               "Can turn their head 180° — spinal vertebrae are unfused",
               "Featured in Amazonian mythology as a shape-shifting trickster"
           ],
           wikipediaTitle: "Amazon_river_dolphin",
           habitatName: "Rio Negro, Amazon, Brazil",
           habitatLat: -3.10, habitatLon: -60.02),

    // ─── EUROPE ───────────────────────────────────────────────────────────────

    Animal(name: "Red Fox", scientific: "Vulpes vulpes", emoji: "🦊",
           category: .mammals, region: .europe, status: .leastConcern,
           description: "The world's most widely distributed wild carnivore thrives from Arctic tundra to city centres. Their intelligence and adaptability make them nature's ultimate generalist.",
           facts: [
               "Most widely distributed wild carnivore on Earth",
               "Can hear a watch ticking from 36 metres away",
               "Use Earth's magnetic field to pinpoint prey beneath snow",
               "Can run at 50 km/h and leap over 2 m high",
               "A male is a 'dog fox', female a 'vixen', baby a 'kit'"
           ],
           wikipediaTitle: "Red_fox",
           habitatName: "English Countryside, UK",
           habitatLat: 51.50, habitatLon: -1.80),

    Animal(name: "European Adder", scientific: "Vipera berus", emoji: "🐍",
           category: .reptiles, region: .europe, status: .leastConcern,
           description: "Britain's only venomous snake is also the world's most widespread viper, ranging from the UK all the way to the Pacific coast of Russia.",
           facts: [
               "Britain's only venomous snake",
               "The only snake known to live within the Arctic Circle",
               "Gives birth to live young rather than laying eggs",
               "Hibernates for up to 6 months in cold northern winters",
               "Distinctive zigzag dorsal pattern provides superb camouflage"
           ],
           wikipediaTitle: "Common_European_adder",
           habitatName: "Scottish Highlands, Scotland",
           habitatLat: 57.00, habitatLon: -4.00),

    Animal(name: "White Stork", scientific: "Ciconia ciconia", emoji: "🦢",
           category: .birds, region: .europe, status: .leastConcern,
           description: "One of Europe's most beloved migratory birds, storks return to the same rooftop nest every year after a 20,000 km round-trip to sub-Saharan Africa.",
           facts: [
               "Migrates up to 20,000 km round-trip to sub-Saharan Africa",
               "Pairs return to the same nest year after year for life",
               "Cannot sing — communicates by loud bill-clattering",
               "A nest used for decades can weigh several hundred kilograms",
               "European folklore credits them with delivering newborn babies"
           ],
           wikipediaTitle: "White_stork",
           habitatName: "Alsace, France",
           habitatLat: 48.60, habitatLon: 7.75),

    Animal(name: "Fire Salamander", scientific: "Salamandra salamandra", emoji: "🦎",
           category: .amphibians, region: .europe, status: .leastConcern,
           description: "Europe's most recognisable amphibian, whose bold yellow-and-black pattern advertises toxic skin secretions that inspired centuries of myths about creatures born from flames.",
           facts: [
               "Yellow and black colouring warns predators of skin toxicity",
               "Gives birth to live larvae — not eggs like most salamanders",
               "Supposedly emerged from burning logs — hence 'fire' salamander",
               "Skin glands secrete alkaloids that paralyse predators' muscles",
               "Can live for over 50 years in captivity"
           ],
           wikipediaTitle: "Fire_salamander",
           habitatName: "Black Forest, Germany",
           habitatLat: 48.00, habitatLon: 8.20),

    Animal(name: "Stag Beetle", scientific: "Lucanus cervus", emoji: "🪲",
           category: .insects, region: .europe, status: .nearThreatened,
           description: "Europe's largest beetle, named for the spectacular antler-like mandibles that males use in elaborate wrestling matches over mating rights — not for feeding.",
           facts: [
               "Europe's largest beetle — up to 8 cm long",
               "Enormous mandibles are for wrestling rivals, not for feeding",
               "Larvae spend 3–7 years underground before emerging",
               "Adult beetles live only a few weeks and barely feed",
               "Larvae eat decaying wood, playing a key role in nutrient cycling"
           ],
           wikipediaTitle: "Stag_beetle",
           habitatName: "New Forest, England",
           habitatLat: 50.88, habitatLon: -1.60),

    Animal(name: "Atlantic Cod", scientific: "Gadus morhua", emoji: "🐟",
           category: .fish, region: .europe, status: .vulnerable,
           description: "Once so abundant it could be scooped from the sea in baskets, Atlantic cod fed European civilisation for centuries — until industrial overfishing collapsed stocks by over 95%.",
           facts: [
               "Once so plentiful it was scooped from the sea in baskets",
               "A single female produces up to 9 million eggs per year",
               "Populations have collapsed by over 95% due to overfishing",
               "Can live 25+ years and grow to nearly 2 m in length",
               "Their collapse is history's defining case study in fisheries failure"
           ],
           wikipediaTitle: "Atlantic_cod",
           habitatName: "North Sea",
           habitatLat: 57.00, habitatLon: 2.00),

    Animal(name: "Brown Bear", scientific: "Ursus arctos", emoji: "🐻",
           category: .mammals, region: .europe, status: .leastConcern,
           description: "Europe's largest land predator roams Scandinavian and Carpathian forests, with populations slowly recovering after centuries of persecution.",
           facts: [
               "Europe's largest land predator — up to 360 kg",
               "Despite size, can sprint at 50 km/h over short distances",
               "Remarkable swimmers — known to cross lakes several kilometres wide",
               "Eat up to 20,000 calories per day before hibernation",
               "European populations reduced but recovering in Finland, Romania, and Sweden"
           ],
           wikipediaTitle: "Brown_bear",
           habitatName: "Carpathian Mountains, Romania",
           habitatLat: 45.68, habitatLon: 25.30),

    Animal(name: "Peregrine Falcon", scientific: "Falco peregrinus", emoji: "🦅",
           category: .birds, region: .europe, status: .leastConcern,
           description: "The fastest animal on the planet in a stoop dive, the peregrine falcon reaches over 320 km/h when striking prey — and has adapted to hunt over every major city in Europe.",
           facts: [
               "Fastest animal on Earth in a dive — over 320 km/h recorded",
               "3rd eyelid protects eyes and maintains vision during high-speed dives",
               "Hunts birds by striking them mid-air at lethal speed",
               "Nests on cliff ledges and increasingly on city skyscrapers",
               "Nearly wiped out by DDT; recovered through worldwide banning of the pesticide"
           ],
           wikipediaTitle: "Peregrine_falcon",
           habitatName: "Swiss Alps",
           habitatLat: 46.80, habitatLon: 8.00),

    Animal(name: "Eurasian Lynx", scientific: "Lynx lynx", emoji: "🐱",
           category: .mammals, region: .europe, status: .leastConcern,
           description: "Europe's largest wild cat was once extinct across most of the continent and is slowly recolonising forests through careful reintroduction programmes.",
           facts: [
               "Europe's largest wild cat — up to 30 kg",
               "Large padded paws act as natural snowshoes",
               "Can leap 6 m onto unsuspecting prey from a standing start",
               "Largely silent — communicates by scent and subtle facial expressions",
               "Reintroduced in Germany, Switzerland, France, and Scotland"
           ],
           wikipediaTitle: "Eurasian_lynx",
           habitatName: "Bavarian Forest, Germany",
           habitatLat: 49.00, habitatLon: 13.40),

    Animal(name: "Common Octopus", scientific: "Octopus vulgaris", emoji: "🐙",
           category: .fish, region: .europe, status: .leastConcern,
           description: "One of the most intelligent invertebrates alive, the common octopus can open jars, use tools, play, and change colour and texture in milliseconds to become invisible.",
           facts: [
               "Three hearts, blue blood, and nine brains (one central + one per arm)",
               "Can change colour and skin texture in under 300 milliseconds",
               "Demonstrated use of tools — carries coconut shells for shelter",
               "Each arm has independent neural processing capability",
               "Adults die after a single reproductive cycle — a truly semelparious animal"
           ],
           wikipediaTitle: "Common_octopus",
           habitatName: "Mediterranean Sea, Italy",
           habitatLat: 42.00, habitatLon: 14.00),

    // ─── OCEANIA ──────────────────────────────────────────────────────────────

    Animal(name: "Red Kangaroo", scientific: "Osphranter rufus", emoji: "🦘",
           category: .mammals, region: .oceania, status: .leastConcern,
           description: "The world's largest marsupial and Australia's largest native land mammal, perfectly adapted to arid environments through their uniquely energy-efficient hopping gait.",
           facts: [
               "World's largest marsupial — up to 90 kg",
               "Newborns are the size of a jellybean and climb unaided to the pouch",
               "Can hop at 70 km/h — and sustain 40 km/h for hours",
               "Cannot walk backwards — hence they appear on Australia's coat of arms",
               "Muscular tail acts as a fifth limb for balance and support"
           ],
           wikipediaTitle: "Red_kangaroo",
           habitatName: "Australian Outback, NT",
           habitatLat: -25.00, habitatLon: 133.00),

    Animal(name: "Saltwater Crocodile", scientific: "Crocodylus porosus", emoji: "🐊",
           category: .reptiles, region: .oceania, status: .leastConcern,
           description: "The world's largest living reptile can swim thousands of kilometres across open ocean and holds the record for the strongest bite ever measured in a living animal.",
           facts: [
               "World's largest living reptile — up to 6 m and 1,000 kg",
               "Strongest bite ever measured in a living animal — 16,000 N",
               "Spotted swimming 900 km from the nearest shore in open ocean",
               "Despite appearances, females are devoted nest-guarders",
               "Can survive months without food after consuming a large meal"
           ],
           wikipediaTitle: "Saltwater_crocodile",
           habitatName: "Kakadu, Northern Territory",
           habitatLat: -12.51, habitatLon: 130.84),

    Animal(name: "Quokka", scientific: "Setonix brachyurus", emoji: "🦘",
           category: .mammals, region: .oceania, status: .vulnerable,
           description: "The so-called 'world's happiest animal' is a small marsupial found almost exclusively on Rottnest Island, where centuries of isolation from predators have made it famously fearless.",
           facts: [
               "Facial anatomy creates a permanent expression resembling a smile",
               "Named Rottnest Island ('rats' nest') by Dutch sailors who mistook them for rats",
               "Can survive without water for long periods by metabolising fat",
               "Mothers can temporarily pause a developing embryo if conditions worsen",
               "Vulnerable to foxes and cats introduced to the mainland"
           ],
           wikipediaTitle: "Quokka",
           habitatName: "Rottnest Island, Western Australia",
           habitatLat: -32.00, habitatLon: 115.52),

    Animal(name: "Platypus", scientific: "Ornithorhynchus anatinus", emoji: "🦫",
           category: .mammals, region: .oceania, status: .nearThreatened,
           description: "The platypus is so bizarre that when the first specimen reached Europe, scientists thought it was a hoax — a duck-billed, beaver-tailed, otter-footed mammal that lays eggs and hunts with electrolocation.",
           facts: [
               "One of only five mammals that lay eggs (monotremes)",
               "Males have venomous spurs on their hind legs",
               "Hunts entirely by electrolocation — detects electrical fields of prey",
               "Closes eyes, ears, and nose underwater — hunts purely by electroreception",
               "Has 10 sex chromosomes — humans have 2"
           ],
           wikipediaTitle: "Platypus",
           habitatName: "Tasmanian Highlands, Australia",
           habitatLat: -42.00, habitatLon: 147.00),

    Animal(name: "Tasmanian Devil", scientific: "Sarcophilus harrisii", emoji: "🦡",
           category: .mammals, region: .oceania, status: .endangered,
           description: "The world's largest carnivorous marsupial is famous for its bone-crushing bite and blood-curdling screams during feeding, and is fighting extinction from a contagious facial tumour disease.",
           facts: [
               "World's largest carnivorous marsupial",
               "Bite is proportionally the strongest of any mammal",
               "Bone-crunching feeding accompanied by blood-curdling screams",
               "Can eat 40% of body weight in a single feeding session",
               "Devil Facial Tumour Disease (DFTD) has killed over 80% of wild individuals"
           ],
           wikipediaTitle: "Tasmanian_devil",
           habitatName: "Tasmania, Australia",
           habitatLat: -42.50, habitatLon: 146.50),

    Animal(name: "Laughing Kookaburra", scientific: "Dacelo novaeguineae", emoji: "🐦",
           category: .birds, region: .oceania, status: .leastConcern,
           description: "Australia's iconic bird is famous for its raucous call — so convincingly human that it's used in jungle film soundtracks. Despite being a kingfisher, it hunts on land.",
           facts: [
               "Call sounds so human it is used in jungle film soundtracks worldwide",
               "Uses 'laughter' to establish territory, not express amusement",
               "A kingfisher that hunts snakes, lizards, and rodents — not fish",
               "Family groups jointly raise chicks; siblings help their parents",
               "Famous for boldly stealing food directly from outdoor barbecues"
           ],
           wikipediaTitle: "Laughing_kookaburra",
           habitatName: "Queensland Bushland, Australia",
           habitatLat: -27.50, habitatLon: 153.00),

    Animal(name: "Wedge-tailed Eagle", scientific: "Aquila audax", emoji: "🦅",
           category: .birds, region: .oceania, status: .leastConcern,
           description: "Australia's largest bird of prey and one of the largest eagles on Earth, the wedge-tailed eagle is capable of taking down prey as large as kangaroos and small emus.",
           facts: [
               "Australia's largest bird of prey — wingspan up to 2.3 m",
               "Can soar to 2,000 m altitude while barely moving its wings",
               "Groups of up to 20 have been observed taking down kangaroos",
               "Mates for life; pairs return to the same enormous nest each year",
               "Was once wrongly persecuted as a livestock killer — now fully protected"
           ],
           wikipediaTitle: "Wedge-tailed_eagle",
           habitatName: "Australian Outback, SA",
           habitatLat: -29.00, habitatLon: 135.00),

    Animal(name: "Leafy Sea Dragon", scientific: "Phycodurus eques", emoji: "🐠",
           category: .fish, region: .oceania, status: .leastConcern,
           description: "Found only in southern Australian waters, this seahorse relative is one of the ocean's most extraordinary camouflage masters — virtually invisible among kelp.",
           facts: [
               "Found only in southern Australian waters — nowhere else on Earth",
               "Leaf-like appendages are camouflage only — not used for propulsion",
               "Males carry and incubate the eggs on a special brood patch",
               "Have no stomach — must eat almost continuously",
               "So well camouflaged they were rarely observed before scuba diving"
           ],
           wikipediaTitle: "Leafy_seadragon",
           habitatName: "Kangaroo Island, South Australia",
           habitatLat: -35.77, habitatLon: 137.00),

    Animal(name: "Blue-ringed Octopus", scientific: "Hapalochlaena lunulata", emoji: "🐙",
           category: .fish, region: .oceania, status: .leastConcern,
           description: "The size of a golf ball but carrying enough venom to kill 26 adults in minutes, the blue-ringed octopus is one of the ocean's most lethal animals and has no antivenom.",
           facts: [
               "Golf-ball-sized yet carries venom to kill 26 humans in minutes",
               "There is no antivenom — the only treatment is assisted breathing",
               "Bites are painless, making them especially dangerous",
               "Glowing blue rings appear as a warning signal when threatened",
               "Produces tetrodotoxin — the same toxin found in pufferfish"
           ],
           wikipediaTitle: "Blue-ringed_octopus",
           habitatName: "Great Barrier Reef, Queensland",
           habitatLat: -18.29, habitatLon: 147.70),

    Animal(name: "Cane Toad", scientific: "Rhinella marina", emoji: "🐸",
           category: .amphibians, region: .oceania, status: .leastConcern,
           description: "Ecology's most notorious cautionary tale: introduced to Australia in 1935 to control beetles, they became one of the world's most destructive invasive species.",
           facts: [
               "Introduced to Australia in 1935 to control beetles — it failed completely",
               "Now listed among the world's 100 worst invasive species",
               "Skin toxins are lethal to dogs, cats, and native crocodiles",
               "A female can lay up to 35,000 eggs twice per year",
               "Native Australian predators evolved no resistance to their toxins"
           ],
           wikipediaTitle: "Cane_toad",
           habitatName: "Queensland Coast, Australia",
           habitatLat: -16.00, habitatLon: 145.00)
]
