import 'package:flutter/material.dart';

class ViewSentViewReceivedScreen extends StatefulWidget {
  const ViewSentViewReceivedScreen({super.key});

  @override
  State<ViewSentViewReceivedScreen> createState() =>
      _ViewSentViewReceivedScreenState();
}

class _ViewSentViewReceivedScreenState
    extends State<ViewSentViewReceivedScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy data for sent and received actions
  final List<Map<String, String>> sentList = [
    {"name": "Alice", "image": "https://via.placeholder.com/150"},
    {"name": "Bob", "image": "https://via.placeholder.com/150"},
    {"name": "Charlie", "image": "https://via.placeholder.com/150"},
  ];

  final List<Map<String, String>> receivedList = [
    {"name": "Diana", "image": "https://via.placeholder.com/150"},
    {"name": "Eve", "image": "https://via.placeholder.com/150"},
    {"name": "Frank", "image": "https://via.placeholder.com/150"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildUserCard(Map<String, String> user) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user["image"]!),
          radius: 30,
        ),
        title: Text(
          user["name"]!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.chat, color: Colors.blue),
          onPressed: () {
            // Handle chat button press
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Start chat with ${user["name"]}")),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Actions"),
        backgroundColor: Colors.black,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Sent"),
            Tab(text: "Received"),
          ],
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Sent Tab
          ListView.builder(
            itemCount: sentList.length,
            itemBuilder: (context, index) {
              return _buildUserCard(sentList[index]);
            },
          ),
          // Received Tab
          ListView.builder(
            itemCount: receivedList.length,
            itemBuilder: (context, index) {
              return _buildUserCard(receivedList[index]);
            },
          ),
        ],
      ),
    );
  }
}
