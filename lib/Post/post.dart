import 'package:flutter/material.dart';

import '../Thoughts/Thoughts.dart';
import '../people/people.dart';
import 'individualPost/inpost.dart';
void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Postpage(),
  ));
}
class Postpage extends StatefulWidget {
  const Postpage({Key? key}) : super(key: key);

  @override
  State<Postpage> createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 216, 217, 207),
            elevation: 0,
            automaticallyImplyLeading: false,
            bottom: const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("THOUGHTS"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("POST"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("PEOPLE"),
                    ),
                  ),
                ]
            ),
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
          body: const TabBarView(children: [
            Thoughts(),
            InPost(),
            People(),
          ]),
        )
    );
  }
}
