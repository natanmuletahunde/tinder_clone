import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child:   Text('Welcome ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color:Colors.white
        ),),
      ),
    );
  }
}