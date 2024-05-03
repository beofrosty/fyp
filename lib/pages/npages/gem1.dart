import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Kyrgyzstan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController? _mapController;
  bool _isEnglish = true;

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
  }

  String getRecommendation() {
    List<String> recs = [
      'Explore the stunning Ala Archa National Park',
      'Discover the vibrant markets of Osh',
      'Hike to the hidden waterfall near Karakol',
    ];
    final index = Random().nextInt(recs.length);
    return recs[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Kyrgyzstan'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: _toggleLanguage,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/q1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isEnglish
                              ? 'Explore the Hidden Gems of Kyrgyzstan'
                              : 'استكشف الجواهر الخفية في قيرغيزستان',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          _isEnglish
                              ? 'Your Interactive GIS Adventure Guide'
                              : 'دليل مغامراتك التفاعلي بنظام معلومات جغرافية',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Key Features
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.map, size: 40, color: Colors.blue), // Map Icon
                      SizedBox(height: 10),
                      Text(_isEnglish
                          ? 'Interactive Maps'
                          : 'الخرائط التفاعلية'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.nature_people,
                          size: 40, color: Colors.green), // Nature Icon
                      SizedBox(height: 10),
                      Text(_isEnglish ? 'Discover Nature' : 'اكتشاف الطبيعة'),
                    ],
                  ),
                  // Add more feature widgets as needed
                ],
              ),
            ),

            // Map Widget
            SizedBox(height: 20),
            Container(
              height: 250, // Adjust height as needed
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(42.8746, 74.5698), // Center on Kyrgyzstan
                  zoom: 7,
                ),
                onMapCreated: (controller) {
                  if (controller != null) {
                    _mapController = controller;
                  } else {
                    // Handle error
                    print(
                        'An error occurred while creating the map controller.');
                    // Display an error message to the user
                  }
                },
              ),
            ),

            // GIS Data Highlight
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[50], // Subtle background color
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'GIS Insights',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _isEnglish
                          ? 'Did you know? There are over 2000 alpine lakes in Kyrgyzstan!'
                          : 'هل تعلم؟ هناك أكثر من 2000 بحيرة جبلية في قيرغيزستان!',
                    ),
                  ],
                ),
              ),
            ),

            // Recommendation
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isEnglish ? 'Just for You...' : 'مخصصة لك...',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(getRecommendation()),
                ],
              ),
            ),

            // Cultural Insights
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isEnglish
                        ? 'Discover Kyrgyz Culture'
                        : 'اكتشاف الثقافة القيرغيزية',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _isEnglish
                        ? 'Experience the warmth of Kyrgyz hospitality and its rich nomadic traditions.'
                        : 'تجربة دفء الضيافة القيرغيزية وتقاليدها الرحلانية الغنية.',
                  ),
                ],
              ),
            ),
            // Call to Action
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the map view
                },
                child: Text(
                  _isEnglish
                      ? 'Begin Your Kyrgyz Adventure'
                      : 'ابدأ مغامرتك القيرغيزية',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
