import 'package:flutter/material.dart';
import 'package:my_practise/utils/CustomColor.dart';

class CustomButtonField extends StatefulWidget {
  double hight;
  double widght;
  String btnText;
   CustomButtonField({Key? key,
   required this.btnText,
   required this.hight,
   required this.widght,
   }) : super(key: key);

  @override
  _CustomButtonFieldState createState() => _CustomButtonFieldState();
}

class _CustomButtonFieldState extends State<CustomButtonField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.hight,
      width: widget.widght,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AllColor.appColor,
      ),
      child: Center(
          child: Text(
        widget.btnText,
        style: TextStyle(
            fontSize: 15,
            color: AllColor.TextColor,
            fontWeight: FontWeight.bold),
      )),

    );
  }
}
