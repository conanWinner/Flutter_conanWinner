import 'package:flutter/material.dart';

class AlertHelper {
  static final Set<String> _shownAlerts = <String>{};

  static void showAlertOnce(
    BuildContext context,
    String content, {
    String? key,
    bool forceShow = false,
  }) {
    final alertKey = key ?? content;

    _shownAlerts.add("0");

    if (forceShow || !_shownAlerts.contains(alertKey)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(content), backgroundColor: Color(0xff53B175)),
        snackBarAnimationStyle: AnimationStyle(
          duration: Duration(milliseconds: 300),
        ),
      );
      if (!forceShow) {
        _shownAlerts.add(alertKey);
      }
    }
  }

  static void resetAlerts() {
    _shownAlerts.clear();
  }
}
