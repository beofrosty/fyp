import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePagee extends StatelessWidget {
  const HomePagee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Destinations'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add notification action
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFF7E0), // Slightly orange background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Arlen Abdyrashitov',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Explore the world with us',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              _buildSearchBar(),
              const SizedBox(height: 30),
              _buildCategorySection(),
              const SizedBox(height: 30),
              _buildDestinationCarousel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search destinations',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: Icon(Icons.search, color: Colors.grey),
      ),
      onChanged: (value) {
        // Handle search input
      },
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCategoryChip('Mountains'),
              _buildCategoryChip('Reservoirs'),
              _buildCategoryChip('National Parks'), // Keep Category 2 unchanged
              _buildCategoryChip('Waterfalls'),
              _buildCategoryChip('Canyons'), // Keep Category 4 unchanged
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(
          label,
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
        backgroundColor: Colors.blue, // Adjust color as needed
      ),
    );
  }

  Widget _buildDestinationCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Destinations',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              5,
              (index) => Container(
                width: 180,
                margin: const EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/a${index + 1}.jpg', // Updated image path
                        height: 100,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _getDestinationName(index), // Updated text
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getDestinationName(int index) {
    switch (index) {
      case 0:
        return 'Lenin Peak';
      case 1:
        return 'Issyk-Kul';
      case 2:
        return 'Ala Archa';
      case 3:
        return 'Abshir Ata';
      case 4:
        return 'Skazka';
      default:
        return 'Destination $index';
    }
  }
}
