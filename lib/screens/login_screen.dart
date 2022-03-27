import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moody/screens/dashboard_screen.dart';
import 'package:moody/screens/signup_screen.dart';
import 'package:moody/navigation_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//form key
  final _formKey = GlobalKey<FormState>();

//editing containers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //Email Field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          //Regex for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        //once input in in, this will move to the next input field
        textInputAction: TextInputAction.next,
        //decoration of the email input fields
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //Password Field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        //hides password input
        obscureText: true,
        //keyboardType: TextInputType.emailAddress,
        validator: (value) {
          //firebase needs a minimum of 6 password characters to create an entry
          //so here, using regex, we are putting password characters to a min of 6
          RegExp regexPasswordValidator = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Please Enter Your Password");
          }

          if (!regexPasswordValidator.hasMatch(value)) {
            return ("Enter A Valid Password (Min. 6 Characters)");
          }

          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        //once input in in, this will move to the next input field
        textInputAction: TextInputAction.done,
        //decoration of the password input field
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //login button
    final Material loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xffffde5a),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          login(emailController.text, passwordController.text);
          //Navigator.pushReplacement(context,
          //    MaterialPageRoute(builder: (context) => const DashboardScreen()));
        },
        child: const Text(
          "Log In",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/circ_moody_logo.png",
                          fit: BoxFit.contain,
                        )),

                    //provides a heightened box between each field
                    const SizedBox(height: 45),

                    emailField,
                    const SizedBox(height: 25),

                    passwordField,
                    const SizedBox(height: 35),

                    loginButton,
                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignupScreen()));
                          },
                          child: const Text(
                            " Sign Up",
                            style: TextStyle(
                                color: Color(0xffffde5a),
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //function for logging in/sign in
  void login(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => NavBar())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}

//Contributed By: AN
