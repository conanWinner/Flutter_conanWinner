import 'package:flutter/material.dart';

class SubItemFoodType extends StatelessWidget {
  const SubItemFoodType({
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
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onSelectPressed?.call();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffE2E2E2),
            minimumSize: const Size(96, 36),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
          ),
          child: const Text(
            "Select",
            style: TextStyle(
              color: Color(0xff53B175),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
