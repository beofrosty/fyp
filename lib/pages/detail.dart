import 'package:flutter/material.dart';
import 'package:qwe/Components/colors.dart';
import 'package:qwe/Widgets/app_large_text.dart';
import 'package:qwe/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors
                      .orange.shade200, // Background color changed to orange
                  image: DecorationImage(
                    image: AssetImage("assets/kol-suu.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Replaced with pop() to go back
                },
                icon:
                    const Icon(Icons.arrow_back), // Changed to back arrow icon
                color: Colors.black54,
              ),
            ),
            Positioned(
              top: 300,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 550,
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(
                      text: "Köl-Suu",
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        AppText(
                          text: "KG, Naryn",
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: AppText(
                          size: 20,
                          text:
                              "Lake Kel-Suu, a jewel in Kyrgyzstan's Ak-Sai Valley, captivates with its emerald waters and dramatic cliffs. Formed by natural forces, this alpine marvel spans 9 kilometers, inviting adventurers to explore its beauty. Accommodations include rustic yurt camps and organized tours, catering to diverse preferences. Activities like horseback riding and hiking offer immersive experiences, but accessing the lake requires navigating challenging terrain. Despite the hurdles, Lake Kel-Suu promises unparalleled serenity and natural splendor for those who venture forth.",
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
