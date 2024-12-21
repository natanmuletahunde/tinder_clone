import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  // Dummy user details for now
  final String userName = "John Doe";
  final String userBio = "Lover of adventures, coffee, and good vibes.";
  final int userAge = 25;
  final String userLocation = "New York, USA";
  final String profilePictureUrl =
      "https://via.placeholder.com/150"; // Replace with actual URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/login'); // Navigate back to login
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Picture
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(profilePictureUrl),
              onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 80),
            ),
            const SizedBox(height: 20),

            // User Name and Details
            Text(
              userName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "$userAge • $userLocation",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                userBio,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // User Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard("Matches", "32"),
                _buildStatCard("Likes", "120"),
                _buildStatCard("Super Likes", "5"),
              ],
            ),
            const SizedBox(height: 30),

            // Buttons for Profile and History
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to edit profile screen
                      Navigator.of(context).pushNamed('/editProfile');
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to swipe history screen
                      Navigator.of(context).pushNamed('/swipeHistory');
                    },
                    icon: const Icon(Icons.history),
                    label: const Text(
                      "View Swipe History",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to subscription upgrade screen
                      Navigator.of(context).pushNamed('/upgrade');
                    },
                    icon: const Icon(Icons.star),
                    label: const Text(
                      "Upgrade to Premium",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build stat cards
  Widget _buildStatCard(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
