import 'package:flutter/material.dart';
import '../Read/Popular.dart';

class BookDetailsPage extends StatefulWidget {
  final ReviewItem reviewItem;

  const BookDetailsPage({super.key, required this.reviewItem});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.reviewItem.name,
          style: const TextStyle(fontSize: 18, letterSpacing: 2),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 216, 217, 207),
        toolbarHeight: 80,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
            iconSize: 25,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/story 8.jpg"),
              maxRadius: 25,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 250,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(widget.reviewItem.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < widget.reviewItem.rating; i++)
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Color.fromARGB(255, 246, 243, 243),
              ),
              child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text( widget.reviewItem.name,
                        style: const TextStyle(
                             fontSize: 20.0, letterSpacing: 2),
                      ),
                    ),
                  ),
                   Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(widget.reviewItem.cont,
                        style: const TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2,
                          height: 2,
                          fontWeight: FontWeight.w100,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 380,
                      height: 50,// Adjust the width according to your needs
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => PDFView(filePath: widget.reviewItem.file,) ,
                          //   ),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 216, 217, 207), backgroundColor: const Color.fromARGB(255, 216, 217, 207), elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'Start To Read',
                          style: TextStyle(color: Colors.black, letterSpacing: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          )
        ],
      ),
    );
  }
}
