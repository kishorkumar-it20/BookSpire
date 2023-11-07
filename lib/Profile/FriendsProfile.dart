import 'package:flutter/material.dart';

import '../people/people.dart';

class FriendsProfile extends StatefulWidget {
  final Friend friend;

  const FriendsProfile(this.friend, {Key? key}) : super(key: key);

  @override
  State<FriendsProfile> createState() => _FriendsProfileState(friend);
}

class _FriendsProfileState extends State<FriendsProfile> {
  late final Friend friend;

  _FriendsProfileState(this.friend);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (friend.name),
          style: const TextStyle(fontSize: 30,letterSpacing: 2),
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
      body: SingleChildScrollView(
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 280,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(friend.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                friend.name,
                                style: const TextStyle(fontSize: 20, letterSpacing: 2),
                              ),
                              const SizedBox(height: 4,),
                              Text(
                                friend.email,
                                style: const TextStyle(fontSize: 15, letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300], // Replace with desired background color
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: IconButton(
                                        // ignore: avoid_print
                                        onPressed: () => print("Icon 3"),
                                        icon: const Icon(Icons.send), // Replace 'icon_3' with the desired icon
                                      ),
                                    ), // Replace with the desired icon
                                    const SizedBox(width: 15), // Add some spacing between icons
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300], // Replace with desired background color
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: IconButton(
                                        // ignore: avoid_print
                                        onPressed: () => print("Icon 3"),
                                        icon: const Icon(Icons.share), // Replace 'icon_3' with the desired icon
                                      ),
                                    ), // Replace with the desired icon
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 380,
                    height: 50,// Adjust the width according to your needs
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement logic for the second button
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 216, 217, 207), backgroundColor: const Color.fromARGB(255, 216, 217, 207), elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        'Fuse Up',
                        style: TextStyle(color: Colors.black, letterSpacing: 2),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("About",style: TextStyle(fontSize: 20,letterSpacing: 1),),
                const SizedBox(height: 5,),
                Text(friend.about,style: const TextStyle(fontSize: 15,letterSpacing: 2,height: 1.5),textAlign: TextAlign.justify),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 190,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              color:  Color.fromARGB(255, 216, 217, 207), // Replace with desired background color
                              borderRadius:  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              children: [
                                const  Padding(padding: EdgeInsets.all(15),
                                  child: Text("Fusion : ",style: TextStyle(fontSize: 20,letterSpacing: 1),textAlign: TextAlign.left,),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(friend.fusion,style: const TextStyle(fontSize: 20,letterSpacing: 1)),
                                ),
                              ],
                            ),
                          ),
                      )
                      ),
                      const SizedBox(width: 25,),
                      SizedBox(
                          height: 50,
                          width: 190,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color:  Color.fromARGB(255, 216, 217, 207), // Replace with desired background color
                                borderRadius:  BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  const  Padding(padding: EdgeInsets.all(15),
                                    child: Text("Blogs : ",style: TextStyle(fontSize: 20,letterSpacing: 1),textAlign: TextAlign.left,),),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(friend.blogs,style: const TextStyle(fontSize: 20,letterSpacing: 1)),
                                  ),
                                ],
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Blogs",style: TextStyle(fontSize: 25,letterSpacing: 2),),
                ),
              Container(
                width: double.infinity,
                height: 350.0,
                decoration: const BoxDecoration(
                color: Colors.white54
                ),
                child: Column(
                  children: [
                    ListTile(
                        leading: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: Image(
                              width: 50,
                              height: 50,
                              image: AssetImage(friend.image),
                              fit: BoxFit.cover,),),
                      title: Text(friend.name,style: const TextStyle(fontSize: 20),),
                      subtitle: const Text("5s ago"),
                      trailing: IconButton(
                        // ignore: avoid_print
                        onPressed: () => print("more"),
                        icon: const Icon(Icons.more_vert),
                          ),
                      ),
                    const SizedBox(
                      width: double.infinity,
                      height: 270,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                            Text("Alex Michaelides",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.w100,),),
                            SizedBox(height: 10,),
                            Text("The Silent Patient",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.w100),),
                            SizedBox(height: 10,),
                            Text("The Silent Patient is an insight into people’s minds, like a maze, holding the readers captive in the book. It is the first novel by Alex Michaelides which debuted on The New York Times Best Seller list at No. 1 and won the Goodreads Choice Award 2019 in the Mystery and Thriller category.",
                              textAlign: TextAlign.justify,style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.w100,letterSpacing: 1,height: 1.5),),
                            SizedBox(height: 10,),
                            ],
                          ),
                        ),
                     ),
                  ],
                )
              ),
              ],
      ),
    )]
      )
      )
    );
  }
}
