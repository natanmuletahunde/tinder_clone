import 'package:flutter/material.dart';

class FavoriteSentFavoriteReceivedScreen extends StatefulWidget {
  const FavoriteSentFavoriteReceivedScreen({super.key});

  @override
  State<FavoriteSentFavoriteReceivedScreen> createState() =>
      _FavoriteSentFavoriteReceivedScreenState();
}

class _FavoriteSentFavoriteReceivedScreenState
    extends State<FavoriteSentFavoriteReceivedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  // Mock data for Favorites Sent and Received
  final List<Map<String, String>> _favoritesSent = [
    {'name': 'John Doe', 'details': 'Loves hiking', 'image': 'https://5.imimg.com/data5/SELLER/Default/2023/7/329252193/LO/EW/HT/2614339/mens-wear.jpg'},
    {'name': 'Emma Stone', 'details': 'Coffee enthusiast', 'image': 'https://blogimg.goldsupplier.com/wp-content/uploads/2024/10/second-row-crochet-2024-10-25T154110.321.png'},
    {'name': 'Chris Evans', 'details': 'Fitness freak', 'image': 'https://www.next.ie/cms/resource/image/690338/portrait_ratio4x5/560/700/8e46e175fc633d6d4a4470e5075580ea/287B8F2263088D7F82A58D8694801B60/3009-trending-feature-3-mens.jpg'},
  ];

  final List<Map<String, String>> _favoritesReceived = [
    {'name': 'Sophia Smith', 'details': 'Food blogger', 'image': 'https://static.vecteezy.com/system/resources/thumbnails/036/068/201/small_2x/ai-generated-beautiful-women-wearing-hijab-generative-ai-photo.jpg'},
    {'name': 'Liam Johnson', 'details': 'Traveler', 'image': 'https://www.apetogentleman.com/wp-content/uploads/2022/03/1960s-mens-fashion.jpg'},
    {'name': 'Olivia Brown', 'details': 'Dog lover', 'image': 'https://menshaircuts.com/wp-content/uploads/2024/03/tp-mens-long-hairstyles-500x333.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.send), text: "Sent"),
            Tab(icon: Icon(Icons.inbox), text: "Received"),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildFavoriteList(_favoritesSent, "No Favorites Sent Yet"),
            _buildFavoriteList(_favoritesReceived, "No Favorites Received Yet"),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteList(List<Map<String, String>> favorites, String emptyMessage) {
    if (favorites.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final favorite = favorites[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(favorite['image']!),
            ),
            title: Text(
              favorite['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              favorite['details']!,
              style: const TextStyle(fontSize: 14),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.message, color: Colors.pinkAccent),
              onPressed: () {
                // Handle "Send Message" button action
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Message sent to ${favorite['name']}!"),
                ));
              },
            ),
            onTap: () {
              // Handle "View Profile" action
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => _buildProfileScreen(favorite),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Mock profile screen
  Widget _buildProfileScreen(Map<String, String> favorite) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${favorite['name']}'s Profile"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(favorite['image']!),
            ),
            const SizedBox(height: 20),
            Text(
              favorite['name']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              favorite['details']!,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
