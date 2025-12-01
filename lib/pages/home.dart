import 'package:flutter/material.dart';
import 'travel_card.dart';
import 'profile_screen.dart';
// Import your location screens
import 'Locations/Hawaii.dart';
import 'Locations/Erbil.dart';
import 'Locations/Milan.dart';
import 'Locations/Paris.dart';
import 'Locations/Rio.dart';

// 1. Create a data model for your places
class Place {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double rating;
  final Widget destinationPage;
  final List<String> categories; // To match with your filters

  Place({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.rating,
    required this.destinationPage,
    required this.categories,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String selectedFilter = 'Most Viewed';
  final TextEditingController _searchController = TextEditingController();

  // 2. Define your data list with categories assigned to them
  final List<Place> allPlaces = [
    Place(
      title: 'Erbil, Kurdistan',
      subtitle: 'Asia',
      imageUrl: 'assets/images/Kurdistan.jpg',
      rating: 5,
      destinationPage: Erbil(),
      categories: ['Most Viewed', 'Nearby', 'Favorites'],
    ),
    Place(
      title: 'Milan, Italy',
      subtitle: 'Europe',
      imageUrl: 'assets/images/Italy.png',
      rating: 4,
      destinationPage: Milan(),
      categories: ['Most Viewed', 'Trending', 'Events'],
    ),
    Place(
      title: 'Lanai, Hawaii',
      subtitle: 'North America',
      imageUrl: 'assets/images/Hawaii.jpg',
      rating: 4,
      destinationPage: Hawaii(),
      categories: ['Most Viewed', 'Latest', 'Favorites'],
    ),
    Place(
      title: 'Paris, France',
      subtitle: 'Europe',
      imageUrl: 'assets/images/Paris.png',
      rating: 5,
      destinationPage: Paris(),
      categories: ['Most Viewed', 'Trending', 'Latest'],
    ),
    Place(
      title: 'Rio de Janeiro, Brazil',
      subtitle: 'South America',
      imageUrl: 'assets/images/Rio.jpg',
      rating: 4,
      destinationPage: Rio(),
      categories: ['Most Viewed', 'Events'],
    ),
  ];

  // 3. List to hold the results currently displayed
  List<Place> _filteredPlaces = [];

  final List<String> filters = [
    'Most Viewed',
    'Nearby',
    'Latest',
    'Trending',
    'Favorites',
    'Events',
  ];

  @override
  void initState() {
    super.initState();
    _filteredPlaces = allPlaces; // Show all initially
  }

  // 4. The Logic to filter the list
  void _runFilter() {
    List<Place> results = allPlaces;

    // A. Filter by Search Text
    if (_searchController.text.isNotEmpty) {
      results = results.where((place) =>
      place.title.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          place.subtitle.toLowerCase().contains(_searchController.text.toLowerCase())
      ).toList();
    }

    // B. Filter by Category Button
    if (selectedFilter != 'Most Viewed') {
      results = results.where((place) => place.categories.contains(selectedFilter)).toList();
    }

    setState(() {
      _filteredPlaces = results;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Search Bar
    final searchBar = Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController, // Connect controller
              onChanged: (value) => _runFilter(), // Trigger filter on typing
              decoration: const InputDecoration(
                hintText: 'Search Places',
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 1,
            color: Colors.grey.shade400,
            margin: const EdgeInsets.symmetric(horizontal: 10),
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {}, // Optional: Add advanced filter logic here
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );

    final homeBodyContent = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "Wander Discover, Explore.",
              style: TextStyle(fontFamily: "Corinthia", fontSize: 25),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: searchBar,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular places",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: "PlayfairDisplay",
                  ),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontFamily: "PlayfairDisplay",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Filter Buttons
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                final filterText = filters[index];
                final isSelected = filterText == selectedFilter;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filterText;
                    });
                    _runFilter(); // Trigger filter on tap
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        filterText,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontFamily: "PlayfairDisplay",
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 50),

          // 5. Dynamic Travel Card List
          SizedBox(
            height: 250,
            child: _filteredPlaces.isEmpty
                ? const Center(child: Text("No places found"))
                : ListView.builder( // Changed from ListView to ListView.builder
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _filteredPlaces.length,
              itemBuilder: (context, index) {
                final place = _filteredPlaces[index];
                return TravelCard(
                  imageUrl: place.imageUrl,
                  title: place.title,
                  subtitle: place.subtitle,
                  rating: place.rating,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => place.destinationPage),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );

    // ... (Rest of your scaffold, screens list, appbar, etc. remains the same)

    // Screens for the bottom navigation
    final List<Widget> screens = [
      homeBodyContent,
      const Center(child: Text('Recents Screen', style: TextStyle(fontSize: 24, fontFamily: "PlayfairDisplay"))),
      const Center(child: Text('Saved Screen', style: TextStyle(fontSize: 24, fontFamily: "PlayfairDisplay"))),
      ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Hi, Guest 👋",
          style: TextStyle(fontSize: 35, fontFamily: "PlayfairDisplay-italic"),
        ),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(Icons.notifications, size: 50, color: Colors.black),
            );
          }),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: screens),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 40), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time, size: 40), label: 'Recents'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border, size: 40), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 40), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      endDrawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: const Drawer(
          backgroundColor: Color(0xFF252525),
          child: Center(child: Text("Log in to see notifications.", style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}