import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Thought {
  final String title;
  final String author;
  final String content;

  Thought({required this.title, required this.author, required this.content});
}

class Thoughts extends StatefulWidget {
  const Thoughts({Key? key}) : super(key: key);

  @override
  State<Thoughts> createState() => _ThoughtsState();
}

class _ThoughtsState extends State<Thoughts> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  List<Thought> thoughtsList = [];

  Future<void> postThought() async {
    final title = titleController.text;
    final author = authorController.text;
    final content = contentController.text;

    final response = await http.post(
      Uri.parse(''), // Replace with your Node.js server URL
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'title': title, 'author': author, 'content': content}),
    );

    if (response.statusCode == 201) {
      setState(() {
        titleController.clear();
        authorController.clear();
        contentController.clear();
      });
    } else {
      print('Failed to post thought');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "POST YOUR THOUGHTS",
                style: TextStyle(fontSize: 18, letterSpacing: 2),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth < 600 ? 20 : 200, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Title Of Book", style: TextStyle(fontSize: 20, letterSpacing: 2),),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: titleController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter Title of the Book",
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text("Author of The Book", style: TextStyle(fontSize: 20, letterSpacing: 2),),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: authorController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter Author of The Book",
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text("Thoughts About The Book", style: TextStyle(fontSize: 20, letterSpacing: 2),),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextFormField(
                      controller: contentController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.multiline,
                      maxLines: 15,
                      maxLength: 2000,
                    ),
                  ),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth < 600 ? 180 : 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement logic for the second button
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 216, 217, 207), backgroundColor: Colors.white, elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black, letterSpacing: 2),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(
                        width: screenWidth < 600 ? 180 : 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: postThought,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 216, 217, 207), backgroundColor: const Color.fromARGB(255, 216, 217, 207), elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Post',
                            style: TextStyle(color: Colors.black, letterSpacing: 2),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
