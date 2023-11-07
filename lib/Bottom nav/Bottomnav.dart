import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState
    extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 8,
      activeColor: Colors.black,
      iconSize: 24,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      duration: const Duration(milliseconds: 800),
      tabBackgroundColor: const Color.fromARGB(255, 216, 217, 207),
      selectedIndex: widget.selectedIndex,
      tabs: [
        GButton(
          icon: LineIcons.home,
          text: 'Home',
          onPressed: () => widget.onTabChange(0),
        ),
        GButton(
          icon: LineIcons.book,
          text: 'Post',
          onPressed: () => widget.onTabChange(1),
        ),
        GButton(
          icon: LineIcons.userFriends,
          text: 'People',
          onPressed: () => widget.onTabChange(2),
        ),
        GButton(
          icon: LineIcons.facebookMessenger,
          text: 'Text',
          onPressed: () => widget.onTabChange(3),
        ),
      ],
    );
  }
}

