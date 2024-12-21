import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  File? _profileImage;

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

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
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey[300],
                backgroundImage:
                    _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null
                    ? const Icon(
                        Icons.add_a_photo,
                        size: 40,
                        color: Colors.grey,
                      )
                    : null,
              ),
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
                  _buildButton(
                    label: "Edit Profile",
                    onPressed: () {
                      // Navigate to edit profile screen
                      Navigator.of(context).pushNamed('/editProfile');
                    },
                    textColor: Colors.redAccent,
                  ),
                  const SizedBox(height: 15),
                  _buildButton(
                    label: "View Swipe History",
                    onPressed: () {
                      // Navigate to swipe history screen
                      Navigator.of(context).pushNamed('/swipeHistory');
                    },
                    textColor: Colors.pinkAccent,
                  ),
                  const SizedBox(height: 15),
                  _buildButton(
                    label: "Upgrade to Premium",
                    onPressed: () {
                      // Navigate to subscription upgrade screen
                      Navigator.of(context).pushNamed('/upgrade');
                    },
                    textColor: Colors.orangeAccent,
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

  // Helper method to build buttons with consistent styling
  Widget _buildButton({
    required String label,
    required VoidCallback onPressed,
    required Color textColor,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // White background for all buttons
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: textColor), // Border matches text color
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: textColor, // Text color specific to each button
        ),
      ),
    );
  }
}
