import 'package:flutter/material.dart';
import 'package:moody/screens/login_screen.dart';
import 'package:moody/screens/logInsignUp.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({ Key? key }) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override 
  void initState(){
    super.initState();
    _navigatetologinSignup();

  }

  _navigatetologinSignup() async {
    //giving the delay time for the splash screen
    await Future.delayed(Duration(seconds: 5),);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => logInsignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffde5a),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/Moody_splashscreen_logo.png", height: 300,),
          const SizedBox(height: 30,),
          /*
          const CircularProgressIndicator(color: Colors.white,),
          */
        ],
      ),
      ),
  
    );
  }
}
  



