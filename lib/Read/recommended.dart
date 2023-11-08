import 'package:bookspire/Individual%20read/InRecommended.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReviewItem {
  final String name;
  final String image;
  final int rating;
  final String cont;

  ReviewItem({required this.name,required this.image,required this.rating,required this.cont});
}
class Recommended extends StatefulWidget {

  const Recommended({super.key});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  List<ReviewItem> items = [];
  Future<void> fetchrem() async{
    print("Response arrived");
    try{
      final response = await http.get(Uri.parse(""));
      if(response.statusCode == 200){
        print('Data Received');
        final List<dynamic> jsonData = json.decode(response.body);
        final List<ReviewItem> fetchedremBook = jsonData.map((data) => ReviewItem(name: data['name'], image: data['image'], rating: data['rating'], cont: data['cont'], )).toList();
        setState(() {
          print("Data Received");
          items = fetchedremBook;
        });
      }else {
        print('Received status code: ${response.statusCode}');
        throw Exception('Failed to load posts');
      }
    }
    catch (error) {
      print('Network error: $error');
      // You can show a friendly error message to the user here
    }
  }
  @override
  void initState() {
    super.initState();
    fetchrem();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final ReviewItem book = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecommendedBook(reviewItem: book),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 600,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(book.image, fit: BoxFit.fitHeight),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(book.name, style: const TextStyle(fontSize: 15, letterSpacing: 2)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        for (int i = 0; i< book.rating; i++)
                          const Icon(Icons.star, color: Colors.amber, size: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
