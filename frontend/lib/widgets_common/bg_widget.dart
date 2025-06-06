import 'package:flutter/material.dart';
import 'package:frontend/consts/images.dart';

Widget bgWidget(Widget? child) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imgBackground),
      fit: BoxFit.fill,
    )),
    child: child,
  );
}

Widget bgWidgetSwar(Widget? child) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage(swarBackground),
      fit: BoxFit.fill,
    )),
    child: child,
  );
}
