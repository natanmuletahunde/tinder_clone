import 'package:flutter/material.dart';

class LikeSentLikeReceivedScreen extends StatefulWidget {
  const LikeSentLikeReceivedScreen({super.key});

  @override
  State<LikeSentLikeReceivedScreen> createState() =>
      _LikeSentLikeReceivedScreenState();
}

class _LikeSentLikeReceivedScreenState
    extends State<LikeSentLikeReceivedScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  // Mock data for Likes Sent and Likes Received
  final List<Map<String, String>> _likesSent = [
    {'name': 'John Doe', 'details': 'Loves hiking', 'image': 'https://static.next.co.uk/resource/blob/665954/cd4a060b600bd320aca95f0ffbfe7185/mw-knitwear-mob-data.jpg'},
    {'name': 'Emma Stone', 'details': 'Coffee enthusiast', 'image': 'https://res.cloudinary.com/the-groomsman-suit/image/upload/f_jpg,h_1340,w_1624,q_auto:eco,f_auto/v1/gatsby-cloudinary/pages/index/spotlight-collection-mens-2?_a=AXAH4S10'},
  ];

  final List<Map<String, String>> _likesReceived = [
    {'name': 'Sophia Smith', 'details': 'Food blogger', 'image': 'https://d1fufvy4xao6k9.cloudfront.net/images/blog/posts/2023/10/hockerty_mens_business_casual_style_743a6931_9bdd_4b4c_b5ba_ee56d4bc2909.jpg'},
    {'name': 'Liam Johnson', 'details': 'Traveler', 'image': 'https://www.themodestman.com/wp-content/uploads/2021/04/Indian-Mens-Hairstyles.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Likes"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.send), text: "Likes Sent"),
            Tab(icon: Icon(Icons.favorite), text: "Likes Received"),
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
            _buildLikesList(_likesSent, "No Likes Sent Yet"),
            _buildLikesList(_likesReceived, "No Likes Received Yet"),
          ],
        ),
      ),
    );
  }

  Widget _buildLikesList(List<Map<String, String>> likes, String emptyMessage) {
    if (likes.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: likes.length,
      itemBuilder: (context, index) {
        final like = likes[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(like['image']!),
            ),
            title: Text(
              like['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              like['details']!,
              style: const TextStyle(fontSize: 14),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.message, color: Colors.pinkAccent),
                  onPressed: () {
                    // Handle "Message" action
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Message sent to ${like['name']}!"),
                    ));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    // Handle "Remove Like" action
                    setState(() {
                      likes.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${like['name']} removed from likes."),
                    ));
                  },
                ),
              ],
            ),
            onTap: () {
              // Handle profile view
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => _buildProfileScreen(like),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Mock profile screen
  Widget _buildProfileScreen(Map<String, String> like) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${like['name']}'s Profile"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(like['image']!),
            ),
            const SizedBox(height: 20),
            Text(
              like['name']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              like['details']!,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
