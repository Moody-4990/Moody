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
      color: Colors.white,
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
              fontSize: 20, color: Color(0xffffde5a), fontWeight: FontWeight.bold),
        ),
      ),
    );


    final Material signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
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
              fontSize: 20, color: Color(0xffffde5a), fontWeight: FontWeight.bold),
        ),
      ),
    );


    return Scaffold(
      backgroundColor: Color(0xffffde5a),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xffffde5a),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //provides a heightened box between each field
                    const SizedBox(height: 45),

                    loginButton,
                    const SizedBox(height: 15),

                    signupButton,

                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
