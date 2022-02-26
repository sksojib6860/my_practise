import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_practise/screens/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
