import 'package:flutter/material.dart';

const primaryColor = Color(0xffF43C6A);
const backgroundColor = Color(0xFF000000);
const textColor = Color(0xFFFFFFFF);
const subTextColor = Color(0xFF828282);
const placeholderColor = Color(0xff272727);
const userCircleColor = Color(0xffB331BE);
const gradientColor1 = Color(0xffEFBF5C);
const gradientColor2 = Color(0xffFF4D44);
const cardBackgroundColor = Color(0xff171717);

const placeholderGradient = LinearGradient(
    colors: [
      placeholderColor,
      Color(0xFF302F2F),
      placeholderColor,
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp);
