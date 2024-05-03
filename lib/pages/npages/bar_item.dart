import 'package:flutter/material.dart';

class BarItem extends StatelessWidget {
  const BarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue, // Replace with your desired color
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star,
                color: Colors.white), // Replace with your desired icon
            SizedBox(width: 8.0),
            Text(
              "Bar Item Page",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
