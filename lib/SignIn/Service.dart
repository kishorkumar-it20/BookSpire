import 'package:bookspire/first_page.dart';
import 'package:flutter/material.dart';

class SignService extends StatefulWidget {
  const SignService({super.key});

  @override
  State<SignService> createState() => _SignServiceState();
}

class _SignServiceState extends State<SignService> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email"),
            SizedBox(height: 10,),
            TextField(
              // controller: titleController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Username or Email",
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Password"),
            SizedBox(height: 10,),
            TextField(
              // controller: titleController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              obscuringCharacter: '●',
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 70),
              child: SizedBox(
                width: 180,
                height: 50,// Adjust the width according to your needs
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>first_page()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 216, 217, 207), backgroundColor: const Color.fromARGB(255, 216, 217, 207), elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'SignIn',
                    style: TextStyle(color: Colors.black, letterSpacing: 2),
                  ),
                ),
              ),
            )
          ],
    ),
    );
  }
}
