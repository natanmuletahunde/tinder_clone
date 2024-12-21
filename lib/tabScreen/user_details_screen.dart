import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: Center(
        child: 
        Text(
          'User Details Screen',
          style: TextStyle(fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white),
        ),
      ),
    );
  }
}