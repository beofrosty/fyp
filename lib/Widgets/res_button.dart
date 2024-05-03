import 'package:flutter/material.dart';
import 'package:qwe/Components/colors.dart';
import 'package:qwe/widgets/app_text.dart';

class ResButton extends StatelessWidget {
  bool? isRes;
  double? width;
  ResButton({super.key, this.width = 120, this.isRes = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isRes == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: isRes == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isRes == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppText(
                      text: "Book Trip Now",
                      color: Colors.white,
                    ))
                : Container(),
            Image.asset("assets/button1.png")
          ],
        ),
      ),
    );
  }
}
