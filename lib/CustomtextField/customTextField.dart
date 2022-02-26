import 'package:flutter/material.dart';
import 'package:my_practise/utils/CustomColor.dart';

class CustomTextField extends StatefulWidget {
  String lavelText;
  String hintText;
  bool obsecureVal;
  TextEditingController conTroller;
  CustomTextField({
    Key? key,
    required this.hintText,
    required this.lavelText,
    required this.obsecureVal,
    required this.conTroller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

String passStore = "";

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28),
      child: TextFormField(
        validator: (value) {
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!);

          if (value.isEmpty) {
            return 'The field can not be empty!';
          }
          if (widget.lavelText == "Email") {
            if (!emailValid) return "Email format is not correct!";
          }
          if (widget.lavelText == "Password") {
            passStore = value;
            if (value.length < 6) return "Password must be 6 char!";
          }
          if (widget.lavelText == "Confirm Password") {
            if (passStore != value) {
              return "Password didn't match";
            }
          }
        },
        controller: widget.conTroller,
        obscureText: widget.obsecureVal,
        cursorColor: AllColor.appColor,
        decoration: InputDecoration(
            labelText: widget.lavelText,
            labelStyle: TextStyle(color: AllColor.appColor),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AllColor.appColor),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AllColor.appColor),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AllColor.appColor,
              ),
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
