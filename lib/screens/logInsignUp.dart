import 'package:flutter/material.dart';
import 'package:moody/screens/signup_screen.dart';
import 'package:moody/screens/login_screen.dart';

class logInsignUp extends StatefulWidget {
  const logInsignUp({ Key? key }) : super(key: key);

  @override
  State<logInsignUp> createState() => _logInsignUpState();
}

class _logInsignUpState extends State<logInsignUp> {
  @override
  Widget build(BuildContext context) {

    final Material loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xffffde5a),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: const Text(
          "LogIn",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );


    final Material signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.yellow,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupScreen()));
        },
        child: const Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );


    return Scaffold(
        backgroundColor: Colors.white,
    );
  }
}