import 'package:flutter/material.dart';
import 'package:frontend/consts/colors.dart';

Widget loadingIndicator(){
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(redColor),
  );
}