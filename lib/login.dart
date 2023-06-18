import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:room_booking_system/admin_manage.dart';
import 'package:room_booking_system/reusable_widgets/reusable_widget.dart';
import 'package:room_booking_system/home.dart';
import 'package:room_booking_system/resetpassword.dart';
import 'package:room_booking_system/room_list.dart';
import 'package:room_booking_system/signup.dart';

void main() => runApp(const Login());

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(color: Colors.orange),
        ),
        body: Container(
            color: Color.fromRGBO(255, 244, 228, 1),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                child: Column(
                  children: <Widget>[
                    logoWidget("assets/images/logo.png"),
                    const SizedBox(height: 40),
                    reusableTextField("Enter Email", Icons.person_outline,
                        false, emailController),
                    const SizedBox(height: 20),
                    reusableTextField("Enter Password", Icons.lock_outline,
                        true, passwordController),
                    const SizedBox(height: 5),
                    forgetPassword(context),
                    const SizedBox(height: 5),
                    firebaseUIButton(context, "Log In", () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        if (emailController.text == 'haqifaq@gmail.com') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManagerScreen()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                      });
                    }),
                    signUpOption()
                  ],
                ),
              ),
            )));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.orange)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(
                color: Colors.orangeAccent, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomCenter,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.orange),
          textAlign: TextAlign.center,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
