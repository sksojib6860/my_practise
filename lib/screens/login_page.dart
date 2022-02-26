import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_practise/CustomtextField/customButtonField.dart';
import 'package:my_practise/CustomtextField/customTextField.dart';
import 'package:my_practise/screens/homePage.dart';
import 'package:my_practise/screens/register%20page.dart';
import 'package:my_practise/utils/CustomColor.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey();
final _auth = FirebaseAuth.instance;
TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              'Log In Or Sign Up',
              style: TextStyle(
                  fontSize: 30,
                  color: AllColor.appColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),

            //email er jonno//
            CustomTextField(
              lavelText: 'Email',
              hintText: 'example@gmail.com',
              obsecureVal: false,
              conTroller: _emailController,
            ),
            SizedBox(
              height: 15,
            ),

            //Password er jonno//
            CustomTextField(
              lavelText: 'Password',
              hintText: 'Enter your password',
              obsecureVal: true,
              conTroller: _passController,
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                signIn(
                    _emailController.text,
                    _passController.text,
                    context
                );
              },
              child: CustomButtonField(
                btnText: 'LOG IN',
                hight: 50,
                widght: 300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 15),
                )),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "SignUp! ",
                      style: TextStyle(fontSize: 15, color: AllColor.appColor),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void signIn(String email,String pass, context) async {

  if (_formKey.currentState!.validate())
  {
    await _auth.signInWithEmailAndPassword
      (email: email, password: pass).then(
            (value) =>
            {
            Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage())),
  }
  ).catchError((e){
      Fluttertoast.showToast(msg: e.message);
    });

  }
}