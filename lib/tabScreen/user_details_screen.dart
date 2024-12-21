import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
         title: const   Text('User Details',
         style: TextStyle(
          color: Colors.white,
         ),
         ),
         centerTitle: true,
         actions: [
          IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
            }, icon:const Icon(
              Icons.logout,
              size: 30,
            )
          ),
         ],
      ),
      body: const Center(
        child: 
        Text(
          'User Details ',
          style: TextStyle(fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.green),
        ),
      ),
    );
  }
}