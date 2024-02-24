import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(255, 211, 116, 33),
        tabs: [
          GButton(icon: Icons.home),
          GButton(icon: Icons.explore),
          GButton(icon: Icons.favorite_outline_sharp),
          GButton(icon: Icons.person_2_outlined),
        ],
      ),
    );
  }
}
