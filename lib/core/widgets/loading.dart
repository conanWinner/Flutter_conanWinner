import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Container(
          color: Colors.black.withOpacity(0.5), // Lớp nền mờ
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.white, // Màu của spinner
            ),
          ),
        ),
    );
  }
}

