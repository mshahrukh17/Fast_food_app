import '../Export/AllExport.dart';

enum SnackBarType {success, delete, info, error, added}

void showUltimateSnackBar(String title, String message, SnackBarType type) {
  Color primaryColor;
  IconData iconData;
  LinearGradient backgroundGradient;

  switch (type) {
    case SnackBarType.success:
      primaryColor =const Color(0xFF69F0AE);
      iconData = Icons.verified_rounded;
      backgroundGradient = LinearGradient(
        colors: [
         const Color(0xFF66BB6A),
         const Color(0xFF388E3C),
        const  Color(0xFF1B5E20)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      break;
    case SnackBarType.delete:
      primaryColor =const Color(0xFFFF5252);
      iconData = Icons.delete;
      backgroundGradient = LinearGradient(
        colors: [
         const Color(0xFFEF5350),
         const Color(0xFFD32F2F),
         const Color(0xFFB71C1C)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      break;
      case SnackBarType.error:
      primaryColor = const Color(0xFFFF5252);
      iconData = Icons.dangerous;
      backgroundGradient = LinearGradient(
        colors: [
         const Color(0xFFEF5350),
         const Color(0xFFD32F2F),
         const Color(0xFFB71C1C)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      break;
    case SnackBarType.info:
      primaryColor =const Color(0xFF448AFF);
      iconData = Icons.info_outline;
      backgroundGradient = LinearGradient(
        colors: [
         const Color(0xFF42A5F5),
         const Color(0xFF1976D2),
         const Color(0xFF0D47A1)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      break;
      case SnackBarType.added:
       primaryColor =const Color(0xFFFFFC44);
      iconData = Icons.favorite_outline;
      backgroundGradient = LinearGradient(
        colors: [
         const Color(0xFFF3F2A4),
         const Color(0xFFFDFB5F),
         const Color(0xFFFFFB00)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      break;
  }

  Get.snackbar(
    title,
    message,
    titleText: CustomMainText(text: title, fontWeight: FontWeight.bold, color: const Color(0xFFFFFFFF), fontSize: 16,),
    messageText: CustomMainText(text: message, fontWeight: FontWeight.w400, color: const Color(0xFFFFFFFF),),
    snackPosition: SnackPosition.TOP,
    // backgroundColor:const Color(0x00000000),
    borderRadius: 16,
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
        color:const Color(0xFFFFFFFF),
        size: 36,
      ),
    ),
    shouldIconPulse: true,
    borderWidth: 2,
    borderColor: primaryColor,
    duration: Duration(seconds: 2),
    overlayBlur: 6,
    overlayColor:const Color(0xFF000000).withOpacity(0.2),
    boxShadows: [
      BoxShadow(
        color:const Color(0xFF000000).withOpacity(0.4),
        spreadRadius: 3,
        blurRadius: 10,
        offset: Offset(3, 5),
      ),
    ],
    isDismissible: true,
    forwardAnimationCurve: Curves.fastOutSlowIn,
    barBlur: 20, 
    mainButton: TextButton(
      onPressed: () => Get.back(),
      style: TextButton.styleFrom(
        backgroundColor:const Color(0xFFFFFFFF).withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        "DISMISS",
        style: TextStyle(color:const Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
      ),
    ),
    backgroundGradient: backgroundGradient,
    animationDuration: Duration(milliseconds: 800),
    leftBarIndicatorColor: primaryColor,
  );
}
