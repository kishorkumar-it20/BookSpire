import 'package:bookspire/SignIn/SignIn.dart';
import 'package:flutter/material.dart';
import 'Bottom nav/Bottomnav.dart';
import 'Genre_detail/genre.dart';
import 'Post/post.dart';
import 'Read/Popular.dart';
import 'Read/recommended.dart';
import 'package:google_sign_in/google_sign_in.dart';
class first_page extends StatefulWidget {
  const first_page({Key? key}) : super(key: key);

  @override
  State<first_page> createState() => _first_pageState();
}

// ignore: camel_case_types
class _first_pageState extends State<first_page> {
  int _selectedIndex = 0;

  void _handleTabChange(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });

    // Handle navigation based on the selected index
    switch (newIndex) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const first_page()),
        );
        break;
      case 1: // Post
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Postpage()),
        );
        break;
      case 2: // People
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const PeoplePage()),
        // );
        break;
      case 3: // Text
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const TextPage()),
        // );
        break;
    }
  }
  List<Genredetail> genres = <Genredetail>[];
  final TextEditingController _searchController = TextEditingController();
  final List<String> tabTitles = ["Popular", "Recommended"];
  final List<Widget> tabContents = [
    Popular(),
    Recommended()
  ];

  @override
  void initState() {
    super.initState();
    genres = getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Novel Talk",
          style: TextStyle(fontSize: 30),
        ),
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
      drawer:  NavigationDrawer(),
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: Row(
              children: [
                Expanded(
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {});
                    },
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.search), onPressed: () {}),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.white, // Default border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Custom border for focused state
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black12, // Border color when focused
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text("Genre",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Row(
                children: genres.map((genre) {
                  return Genres_details(
                    image: genre.image,
                    genre: genre.genre,
                  );
                }).toList(),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Expanded(
            child: DefaultTabController(
              length: tabContents.length,
              child: Column(
                children: [
                  TabBar(
                    unselectedLabelColor:
                    const Color.fromARGB(255, 216, 217, 207),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 216, 217, 207),
                    ),
                    tabs: tabTitles.map((title) {
                      return Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: const Color.fromARGB(255, 216, 217, 207),
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
      bottomNavigationBar: BottomNavigationBarWidget(
      selectedIndex: _selectedIndex,
      onTabChange: _handleTabChange,
    ),
    );
  }
}
 class NavigationDrawer extends StatefulWidget {

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer>{

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  void _signOut() {
    _googleSignIn.signOut();

    Navigator.pop(context);
  }
   @override
   Widget build(BuildContext context) =>  Drawer(
     child: ListView(
       padding: EdgeInsets.zero,
       children: [
         UserAccountsDrawerHeader(
           accountName: const Text("Alice",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.w400),),
           accountEmail: const Text("Alice123@gmail.com",style: TextStyle(fontSize: 17,color: Colors.grey),),
           currentAccountPicture: GestureDetector(
             child:  InkWell(
               child:  const CircleAvatar(
                 backgroundImage: AssetImage("assets/story 8.jpg"),
                 maxRadius: 25,
               ),
               onTap: (){},
             )
           ),
           decoration: const BoxDecoration(
             color: Color.fromARGB(244, 199, 181, 160),
             image: DecorationImage(image: AssetImage("assets/back_nav.jpg",),fit: BoxFit.cover),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Column(
             children: [
                ListTile(
                 leading: const Icon(Icons.home),
                 title: const Text('Home'),
                 onTap: () {},
                  minVerticalPadding: 25,
               ),

               ListTile(
                 leading: const Icon(Icons.favorite),
                 title: const Text('Favorite'),
                 onTap: () {},
                 minVerticalPadding: 25,
               ),
               ListTile(
                 leading: const Icon(Icons.notifications),
                 title: const Text('Notifications'),
                 onTap: () {},
                 minVerticalPadding: 25,
               ),
               ListTile(
                 leading: const Icon(Icons.message),
                 title: const Text('Message'),
                 onTap: () {},
                 minVerticalPadding: 25,
               ),
               ListTile(
                 leading: const Icon(Icons.settings),
                 title: const Text('Setting'),
                 onTap: () {},
                 minVerticalPadding: 25,
               ),
               ListTile(
                 leading: const Icon(Icons.book),
                 title: const Text('Continue reading'),
                 onTap: () {},
                 minVerticalPadding: 25,
               ),
               const Divider(
                 color: Colors.black12,
               ),
               ListTile(
                 leading: const Icon(Icons.logout),
                 title: const Text('Sign out'),
                 onTap:  () => _signOut(),
               ),
             ],
           )
         ),
       ],
     ),
   );
}
// ignore: camel_case_types
class Genres_details extends StatefulWidget {
  final String genre, image;
   const Genres_details({super.key, required this.genre,required this.image});

  @override
  State<Genres_details> createState() => _Genres_detailsState();
}

// ignore: camel_case_types
class _Genres_detailsState extends State<Genres_details> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child:InkWell(
          child: CircleAvatar(
            backgroundImage: AssetImage(widget.image),
            maxRadius: 35,
          ),
            onTap: (){},
          )
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:0),
          child: Text(
            widget.genre,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}





