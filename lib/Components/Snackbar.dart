import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showUltimateSnackBar(String title, String message, bool isSuccess) {
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
            color: isSuccess ? Colors.greenAccent : Colors.redAccent,
            blurRadius: 20,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Icon(
        isSuccess ? Icons.verified_rounded : Icons.warning_amber_rounded,
        color: Colors.white,
        size: 36,
      ),
    ),
    shouldIconPulse: true,
    borderWidth: 2,
    borderColor: isSuccess ? Colors.greenAccent : Colors.redAccent,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        "DISMISS",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
    backgroundGradient: LinearGradient(
      colors: isSuccess
          ? [Colors.green.shade400, Colors.green.shade700, Colors.green.shade900]
          : [Colors.red.shade400, Colors.red.shade700, Colors.red.shade900],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    animationDuration: Duration(milliseconds: 800),
    leftBarIndicatorColor: isSuccess ? Colors.greenAccent : Colors.redAccent,
  );
}
