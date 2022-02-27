import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_practise/CustomtextField/customButtonField.dart';
import 'package:my_practise/CustomtextField/customTextField.dart';
import 'package:my_practise/model/usser_model.dart';
import 'package:my_practise/screens/login_page.dart';
import 'package:my_practise/utils/CustomColor.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
final _auth = FirebaseAuth.instance;
final GlobalKey <FormState> _formKey= GlobalKey();
TextEditingController _emailController= TextEditingController();
TextEditingController _passController= TextEditingController();
TextEditingController _confirmpassController= TextEditingController();
TextEditingController _nameController= TextEditingController();
TextEditingController _phoneController= TextEditingController();
TextEditingController _ageController= TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              Text(
                'Sign Up !',
                style: TextStyle(
                    fontSize: 30,
                    color: AllColor.TextColor,
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
                lavelText: 'Name',
                hintText: 'Enter your full-name',
                obsecureVal: false,
                conTroller: _nameController,
              ),


              SizedBox(
                height: 15,
              ),

              //Password er jonno//
              CustomTextField(
                lavelText: 'Phone',
                hintText: 'Enter your Phone Number',
                obsecureVal: false,
                conTroller: _phoneController,
              ),

              SizedBox(
                height: 15,
              ),

              //Password er jonno//
              CustomTextField(
                lavelText: 'Age',
                hintText: 'Enter your Age',
                obsecureVal: false,
                conTroller: _ageController,
              ),

              SizedBox(
                height: 15,
              ),

              CustomTextField(
                lavelText: 'Password',
                hintText: 'Enter your password',
                obsecureVal: true,
                conTroller: _passController,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                lavelText: 'Confirm Password',
                hintText: 'Re-enter your password',
                obsecureVal: true,
                conTroller: _confirmpassController,
              ),

              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  signUp(_emailController.text,
                      _passController.text,
                    context
                  );
                },
                child: CustomButtonField(
                  btnText: 'Sign Up!',
                  hight: 50,
                  widght: 300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void signUp(String email, String pass, context)async{
  if(_formKey.currentState!.validate()){
    await _auth.createUserWithEmailAndPassword(email: email, password: pass).then((value) => {
      saveUserDetails(),
    Fluttertoast.showToast(msg: "Signup Successful"),
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()))
    }).catchError((e){
      Fluttertoast.showToast(msg: e.message);
    });
  }
}



void saveUserDetails()async{
  FirebaseFirestore firestore123= FirebaseFirestore.instance;
  User? user= _auth.currentUser;
  UsserModel userModel= UsserModel();
  userModel.uid= user!.uid;
  userModel.email= _emailController.text;
  userModel.age= _ageController.text;
  userModel.name= _nameController.text;
  userModel.phone= _phoneController.text;
  
  await firestore123.collection("usser")
      .doc(user.uid).set(userModel.toMap());
  Fluttertoast.showToast(msg: "Data Saved Successfully");
}