import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/consts/colors.dart';
import 'package:frontend/consts/styles.dart';
import 'package:frontend/widgets_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.color(darkFontGrey).fontFamily(bold).size(18).make(),
        const Divider(),
        10.heightBox,
        "Are you sure to exit?".text.color(darkFontGrey).size(16).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
                color1: Colors.purple,
                onPress: () {
                  SystemNavigator.pop();
                },
                textColor: whiteColor,
                title: "Yes"),
            ourButton(
                color1: Colors.purple,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: whiteColor,
                title: "No"),
          ],
        )
      ],
    ).box.roundedSM.color(lightGrey).padding(const EdgeInsets.all(12.0)).make(),
  );
}
