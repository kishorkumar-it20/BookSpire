import 'package:flutter/material.dart';

import '../Profile/FriendsProfile.dart';
 class People extends StatefulWidget {
   const People({Key? key}) : super(key: key);

   @override
   State<People> createState() => _PeopleState();
 }

 class _PeopleState extends State<People> {
   final suggestions = [
     Friend('John Doe', 'assets/story 6.jpg','johndoe@gmail.com','Journey through the Pages: Where Imagination Takes Flight 📚✨','1777','259'),
     Friend('Jane Smith', 'assets/story 5.jpg','janesmith@yahoo.com','📖🌟 Exploring new worlds, one page at a time. 🌍🔍','1707','200'),
     Friend('Christopher', 'assets/story 4.jpg','Christopher@gmail.com','📚❤️ "Books: Where my heart finds its home. ❤️📚"','1507','150'),
     Friend('Emily', 'assets/story 7.jpg','Emily@yahoo.com','📖✈️ "Adventure-bound through the pages of imagination. 🌄📖','1523','76'),
     Friend('Olivia', 'assets/story 8.jpg','Olivia@gmail.com','📚🌌 "Universe of stories, waiting to be explored. 🌠📚"','1007','80'),
     Friend('Emma', 'assets/story 9.jpg','Emma@yahoo.com','📖🌈 "Finding rainbows within the lines of a book. 🌈📖"','3000','90'),
     Friend('Sophia', 'assets/image/image 1.jpg','Sophia@gmail.com','📚💭 "Dreamers sanctuary: Pages filled with thoughts. 💫💭"','2007','100'),
     Friend('Isabella', 'assets/image/image 2.jpg','Isabella@yahoo.com','📖💖 "Falling in love with characters and their tales. 💕📖"','1117','99'),
     Friend('Charlotte', 'assets/image/image 3.jpg','Charlotte@gmail.com','📖🌼 "Blossoming ideas in the garden of words. 🌱📖"','1771','199'),
     Friend('Daniel', 'assets/image/image 4.jpg','Daniel@yahoo.com','📚🔍 "Every page holds a new mystery. 🕵️‍♂️📚"','1000','600'),
   ];
   @override
   Widget build(BuildContext context) {
     return  Column(
       children: [
         const Padding(
           padding: EdgeInsets.all(20),
           child: Text(
             'People You May Know',
             style: TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.bold,
               letterSpacing: 2
             ),
           ),
         ),
         Expanded(
           child: FriendSuggestions(suggestions),
         ),
       ],
     );
   }
 }
class Friend {
  final String name;
  final String image;
  final String email;
  final String about;
  final String fusion;
  final String blogs;

  Friend(this.name, this.image, this.email, this.about, this.fusion, this.blogs);
}
class FriendSuggestions extends StatefulWidget {
  final List<Friend> suggestions;

  const FriendSuggestions(this.suggestions, {super.key});

  @override
  State<FriendSuggestions> createState() => _FriendSuggestionsState();
}

class _FriendSuggestionsState extends State<FriendSuggestions> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.suggestions.length,
      itemBuilder: (context, index) {
            final friend = widget.suggestions[index];
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FriendsProfile(friend),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: const Color.fromARGB(255, 216, 217, 207),
                  child: SizedBox(
                    width: double.infinity,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Container(
                        width: 45,
                        // Set the width and height to make it a square
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          // You can adjust the radius as needed
                          image: DecorationImage(
                            image: AssetImage(friend.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        friend.name,
                        style: const TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Implement logic for the second button
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          primary: Colors.white,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text('Fuse Up', style: TextStyle(
                            color: Colors.black, letterSpacing: 2),),
                      ),

                    ),
                  ),
                )
            );
          },
        );
      }
}

