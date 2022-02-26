import 'package:flutter/material.dart';
import 'package:my_practise/utils/CustomColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Center(child: Text('HomePage',style: TextStyle(color: AllColor.appColor),))
      ],
      ),

    );
  }
}
