import 'package:flutter/material.dart';

abstract class UtilSize {
  //base mockup Figma size
  static const  double _baseHeight = 568;
  static const  double _baseWidth = 320;
  static double height(double heightX, BuildContext context) {
    return MediaQuery.of(context).size.height*heightX/_baseHeight;
  }
  static double width(double widthX, BuildContext context) {
    return MediaQuery.of(context).size.width*widthX/_baseWidth;
  }
}