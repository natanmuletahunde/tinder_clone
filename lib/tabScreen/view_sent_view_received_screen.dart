import 'package:flutter/material.dart';


class ViewSentViewReceivedScreen extends StatefulWidget {
  const ViewSentViewReceivedScreen({super.key});

  @override
  State<ViewSentViewReceivedScreen> createState() => _ViewSentViewReceivedScreenState();
}

class _ViewSentViewReceivedScreenState extends State<ViewSentViewReceivedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child:   Text('View Sent View Received Screen',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color:Colors.white
        ),),
      ),
    );
  }
}