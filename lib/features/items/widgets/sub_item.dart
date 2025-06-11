import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubItem extends StatelessWidget {
  const SubItem({
    super.key,
    required this.urlImage,
    required this.name,
    this.onSelectPressed,
  });
  final String urlImage;
  final String name;
  final VoidCallback? onSelectPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(urlImage, height: 32),
            SizedBox(width: 6),
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
