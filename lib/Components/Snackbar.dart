import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackBarType { success, delete, info, login }

void showUltimateSnackBar(String title, String message, SnackBarType type) {
  // Define variables based on the type of snackbar.
  Color primaryColor;
  IconData iconData;
  LinearGradient backgroundGradient;

  // Use a switch-case to set properties for each type.
  switch (type) {
    case SnackBarType.success:
      primaryColor = Colors.greenAccent;
      iconData = Icons.verified_rounded;
      backgroundGradient = LinearGradient(
        colors: [
          Colors.green.shade400,
          Colors.green.shade700,
          Colors.green.shade900
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      break;
    case SnackBarType.delete:
      primaryColor = Colors.redAccent;
      iconData = Icons.delete;
      backgroundGradient = LinearGradient(
        colors: [
          Colors.red.shade400,
          Colors.red.shade700,
          Colors.red.shade900
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      break;
    case SnackBarType.info:
      primaryColor = Colors.blueAccent;
      iconData = Icons.info_outline;
      backgroundGradient = LinearGradient(
        colors: [
          Colors.blue.shade400,
          Colors.blue.shade700,
          Colors.blue.shade900
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      break;
    case SnackBarType.login:
      primaryColor = Colors.orangeAccent;
      iconData = Icons.login;
      backgroundGradient = LinearGradient(
        colors: [
          Colors.orange.shade400,
          Colors.orange.shade700,
          Colors.orange.shade900
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      break;
  }

  // Display the snackbar with the properties set above.
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.transparent,
    colorText: Colors.white,
    borderRadius: 18,
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
    icon: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.bounceOut,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: primaryColor,
            blurRadius: 20,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 36,
      ),
    ),
    shouldIconPulse: true,
    borderWidth: 2,
    borderColor: primaryColor,
    duration: Duration(seconds: 4),
    overlayBlur: 6,
    overlayColor: Colors.black.withOpacity(0.2),
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.4),
        spreadRadius: 3,
        blurRadius: 10,
        offset: Offset(3, 5),
      ),
    ],
    isDismissible: true,
    forwardAnimationCurve: Curves.fastOutSlowIn,
    barBlur: 25, // Stronger glass effect
    mainButton: TextButton(
      onPressed: () => Get.back(),
      style: TextButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        "DISMISS",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
    backgroundGradient: backgroundGradient,
    animationDuration: Duration(milliseconds: 800),
    leftBarIndicatorColor: primaryColor,
  );
}
