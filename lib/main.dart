import 'package:bookspire/SignIn/SignIn.dart';
import 'package:bookspire/first_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),

  )
  );
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Bookopolis",style: TextStyle(fontSize: 30),),
                const SizedBox(height: 40),
                const Text("Unlock the Magic of Reading",style: TextStyle(fontSize: 30),),
                const Spacer(),
                SizedBox(
                  width: 400,
                  height: 100,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white,// Background color// Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                      child:  const Text("Start Reading") ,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
//#FFFFFF, #FFFFFF




