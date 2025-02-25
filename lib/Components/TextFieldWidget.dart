// ignore_for_file: must_be_immutable
import '../Export/AllExport.dart';

class TextFieldWidget extends StatelessWidget {
  String labeltext;
  TextEditingController controller;
  var prefixicon;
  var suffixicon;
  var obscuretext;
  var keyboardType;
  TextFieldWidget(
      {super.key,
      required this.controller,
      required this.keyboardType,
      required this.labeltext,
      this.obscuretext = false,
      this.prefixicon,
      this.suffixicon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscuretext,
        cursorColor:const Color(0xff009944),
        keyboardType: keyboardType,
        obscuringCharacter: "*",
        showCursor: true,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
        autocorrect: true,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color:const Color(0xFF000000)
          ),
          contentPadding: EdgeInsets.all(15),
          suffixIcon: suffixicon,
          prefixIcon: prefixicon,
          labelText: labeltext,
          filled: true,
          fillColor:const Color(0xFFFFFFFF),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:const Color(0xff009944), width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:const Color(0xFFBDBDBD), width: 1.1)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:const Color(0xFFBDBDBD), width: 1.1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:const Color.fromARGB(255, 244, 67, 54), width: 1.1)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:const Color(0xFFF44336), width: 1.1)),
        ),
      ),
    );
  }
}
