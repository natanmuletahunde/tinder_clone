import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  List<dynamic> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    const String apiUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5e8ed12949814176ab54b11ee8096c4e";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          articles = data["articles"];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception("Failed to load news");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching news: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // Get the screen width
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Feed"),
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : articles.isEmpty
              ? const Center(
                  child: Text(
                    "No articles available",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    final imageUrl = article["urlToImage"] ??
                        "https://via.placeholder.com/150"; // Placeholder if image is null
                    final title = article["title"] ?? "No Title";
                    final description = article["description"] ?? "No Description";

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Responsive Network Image
                          FadeInImage.assetNetwork(
                            placeholder: "assets/placeholder.png", // Add a local placeholder image
                            image: imageUrl,
                            width: double.infinity,
                            height: screenWidth * 9 / 16, // Maintain 16:9 aspect ratio
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/placeholder.png", // Placeholder for image load errors
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: screenWidth * 9 / 16, // Maintain 16:9 aspect ratio
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              description,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  // Add like functionality
                                },
                                icon: const Icon(Icons.thumb_up),
                                label: const Text("Like"),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  // Add comment functionality
                                },
                                icon: const Icon(Icons.comment),
                                label: const Text("Comment"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
