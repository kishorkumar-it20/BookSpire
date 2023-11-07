import 'package:bookspire/SignIn/Service.dart';
import 'package:flutter/material.dart';
import 'package:bookspire/SignIn/SignUp.dart';


class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  final List<String> tabTitles = ["Sign-in", "Sign-Up"];
  final List<Widget> tabContents = [
   SignService(),
    Signup(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF4FAEED9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("BOOK-SPIRE", style: TextStyle(fontSize: 35, letterSpacing: 2, color: Colors.black)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 70,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 30,
              height: 0,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  // Add your onPressed functionality here
                },
                iconSize: 15,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 350,
            height: 480,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Expanded(
                  child: DefaultTabController(
                    length: tabContents.length,
                    child: Column(
                      children: [
                        TabBar(
                          unselectedLabelColor:
                          const Color(0xF4FAEED9),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xF4FAEED9),
                          ),
                          tabs: tabTitles.map((title) {
                            return Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color:  const Color(0xF4FAEED9),
                                    width: 1,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: tabContents,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
