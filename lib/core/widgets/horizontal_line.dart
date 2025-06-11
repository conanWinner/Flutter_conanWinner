import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key, required this.height, required this.color, required this.horizontal, required this.vertical});
  final double vertical;
  final double horizontal;
  final int color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Color(color),
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    );
  }
}
