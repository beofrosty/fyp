import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qwe/pages/npages/ch.dart';
import 'package:qwe/pages/npages/home.dart';
import 'package:qwe/pages/welcome.dart';

import 'package:qwe/profile/utils.dart';
import 'package:qwe/pages/home1.dart';
import 'package:qwe/pages/profile.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  int currentIndex = 1;

  final navScreen = [
    const HomePagee(),
    const HomePage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade800, Colors.blue.shade600],
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedFontSize: 16,
          unselectedItemColor: Colors.white70,
          selectedLabelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          selectedItemColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: navScreen[currentIndex],
    );
  }
}
