import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productivity_app/services/auth.dart';
import 'package:productivity_app/sign_in/sign_in_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (context) => EmailSignInPage(),
    ));
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Image.asset(
                "assets/images/signup.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 16),
            Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'The Only \nProductivity\nApp You need!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Container(
                    height: 45,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      onPressed: () => _signInWithEmail(context),
                      child: Text(
                        "Sign Up with Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _signInWithGoogle,
                        child: AuthenticationButton(
                          buttonChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.google,
                                color: Colors.white70,
                              ),
                              SizedBox(width: 16.0),
                              Text(
                                "Google",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 35.0),
                      GestureDetector(
                        onTap: _signInWithFacebook,
                        child: AuthenticationButton(
                          buttonChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.facebook,
                                color: Colors.white,
                              ),
                              SizedBox(width: 16.0),
                              Text(
                                "Facebook",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 22,
                          decoration: TextDecoration.none,
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: _signInAnonymously,
                    child: Container(
                      height: 45,
                      width: 370,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          "Go Anonymous",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Divider(
                    color: Colors.white70,
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    children: [
                      Text(
                        'By continuing you agree with term and conditions',
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: Colors.white70,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthenticationButton extends StatelessWidget {
  AuthenticationButton({required this.buttonChild});
  final Widget buttonChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            width: 1.0,
            color: Colors.white,
          )),
      child: buttonChild,
    );
  }
}
