import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import '../../Bottom nav/Bottomnav.dart';


class PostData {

  final DateTime timestamp;
  final String author;
  final String title;
  final String content;

  PostData({

    required this.timestamp,
    required this.author,
    required this.title,
    required this.content,
  });
}

class InPost extends StatefulWidget {
  const InPost({Key? key}) : super(key: key);

  @override
  State<InPost> createState() => _InPostState();
}

class _InPostState extends State<InPost> {
  List<PostData> posts = [];
  bool isLiked = false;
  bool isBookmarked = false;

  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.252.30:3000/posts'));

      if (response.statusCode == 200) {
        if (response.body != null) {
          final List<dynamic> jsonData = json.decode(response.body);
          final List<PostData> fetchedPosts = jsonData.map((data) => PostData(
            author: data['author'] ?? '', // Provide default values or handle null values
            title: data['title'] ?? '',
            content: data['content'] ?? '',
            timestamp: DateTime.parse(data['timestamp'] ?? ''), // Handle timestamp as necessary
          )).toList();

          setState(() {
            posts = fetchedPosts;
          });
        } else {
          print('Response body is null');
          // Handle the case where the response body is null, if needed
        }
      } else {
        print('Received status code: ${response.statusCode}');
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      print('Network error: $error');
      // You can show a friendly error message to the user here
    }
  }


  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void toggleBook() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  String calculateTimeDifference(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} mins ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} h ago';
    } else {
      final formatter = DateFormat('yyyy-MM-dd HH:mm');
      return 'on ${formatter.format(timestamp)}';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          final PostData post = posts[index];
          final formattedTimestamp = calculateTimeDifference(post.timestamp);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 400.0,
              decoration: const BoxDecoration(
                color: Colors.white54,
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      child: ClipRRect(
                        borderRadius:  BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Image(
                          width: 150,
                          image: AssetImage("assets/image/image 8.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title:const Text(
                      "Sophie",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(formattedTimestamp),
                    trailing: IconButton(
                      onPressed: () => print("more"),
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 270,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            post.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            post.author,
                            style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            post.content,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w100,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: IconButton(
                          onPressed: toggleLike,
                          icon: isLiked
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          color: isLiked ? Colors.black : null,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () => print("Icon 2"),
                          icon: const Icon(Icons.mode_comment),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () => print("Icon 3"),
                          icon: const Icon(Icons.send),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: IconButton(
                          onPressed: toggleBook,
                          icon: isBookmarked
                              ? const Icon(Icons.bookmark)
                              : const Icon(Icons.bookmark_outline_rounded),
                          color: isBookmarked ? Colors.black : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 1,
        onTabChange: (index) {},
      ),
    );
  }
}
