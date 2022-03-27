import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moody/model/user_model.dart';
import 'package:moody/screens/dashboard_screen.dart';
import 'package:moody/navigation_bar.dart';
import 'package:moody/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controllers
  final firstNameEditController = TextEditingController();
  final lastNameEditController = TextEditingController();
  final emailEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  final confirmPasswordEditController = TextEditingController();

  //firebase authentication
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //firstName Field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditController,
        keyboardType: TextInputType.name,
        validator: (value) {
          //we want firstName to be a min of 3 characters
          //so here, using regex
          RegExp regexPasswordValidator = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Please Enter Your First Name");
          }

          if (!regexPasswordValidator.hasMatch(value)) {
            return ("Enter A Valid First Name (Min. 3 Characters)");
          }

          return null;
        },
        onSaved: (value) {
          firstNameEditController.text = value!;
        },
        //once input in in, this will move to the next input field
        textInputAction: TextInputAction.next,
        //decoration of the email input fields
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //lastName Field
    final lastNameField = TextFormField(
        autofocus: false,
        controller: lastNameEditController,
        keyboardType: TextInputType.name,
        validator: (value) {
          //we want lastName to be a min of 3 characters
          //so here, using regex
          if (value!.isEmpty) {
            return ("Please Enter Your Last Name");
          }
          return null;
        },
        onSaved: (value) {
          lastNameEditController.text = value!;
        },
        //once input in in, this will move to the next input field
        textInputAction: TextInputAction.next,
        //decoration of the email input fields
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email Field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditController,
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
          emailEditController.text = value!;
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

    //password Field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditController,
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
          passwordEditController.text = value!;
        },
        //once input in in, this will move to the next input field
        textInputAction: TextInputAction.next,
        //decoration of the email input fields
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //confirm password Field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditController,
        obscureText: true,
        //keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (confirmPasswordEditController.text.length > 6 &&
              confirmPasswordEditController.text !=
                  passwordEditController.text) {
            return ("Password does not match");
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditController.text = value!;
        },
        //once input in in, this will move to the next input field
        textInputAction: TextInputAction.done,
        //decoration of the email input fields
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //sign up button
    final Material signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xffffde5a),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditController.text, passwordEditController.text);
        },
        child: const Text(
          "Signup",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        /*
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xffffde5a),
            ),
            onPressed: () {
              //passes to root, pops off to login
              Navigator.of(context).pop();
            },
          ),
        ),
        */
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: //const EdgeInsets.all(36.0),
                    const EdgeInsets.fromLTRB(36, 2, 36, 36),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 160,
                          child: Image.asset(
                            "assets/circ_moody_logo.png",
                            fit: BoxFit.contain,
                          )),

                      //provides a highted box between each field
                      const SizedBox(height: 10),

                      //fname field
                      firstNameField,
                      const SizedBox(height: 20),

                      //lname field
                      lastNameField,
                      const SizedBox(height: 20),

                      //email field
                      emailField,
                      const SizedBox(height: 20),

                      //password field
                      passwordField,
                      const SizedBox(height: 20),

                      //confirm password
                      confirmPasswordField,
                      const SizedBox(height: 20),

                      //signupbuttom
                      signupButton,
                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Already have an account?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginScreen()));
                            },
                            child: const Text(
                              " LogIn",
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
        ));
  }

  //sign up function, performs signing up including adding the user details to the firebase firestore DB
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => (addDetailsToFirestore()))
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }

  //adding the signup details to the firebase DB
  addDetailsToFirestore() async {
    //includes calling firestore
    //includes calling the user model
    //sending local values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing over all current users values
    //! - null safety
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditController.text;
    userModel.lastName = lastNameEditController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
        (route) => false);
  }
}

//Contributed By: AN
