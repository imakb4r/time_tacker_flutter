import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      // // appBar: AppBar(
      // //   centerTitle: true,
      // //   title: Text(
      // //     "Time Tracker",
      // //     style: TextStyle(
      // //       fontSize: 24,
      // //       fontWeight: FontWeight.bold,
      // //     ),
      // //   ),
      //   elevation: 2.0,
      // ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: (){},
              child: SinginButton(text: "Sign in with Google")
            ),
            SizedBox(height: 8.0),
            GestureDetector(
                onTap: (){},
                child: SinginButton(text: "Sign in with Facebook")
            ),
            SizedBox(height: 8.0),
            GestureDetector(
                onTap: (){},
                child: SinginButton(text: "Sign in with Email")
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.white),
            ),
            GestureDetector(
                onTap: (){},
                child: SinginButton(text: "Sign in with Google")
            ),
          ],
        ),
      ),
    );
  }
}

class SinginButton extends StatelessWidget {
  SinginButton({required this.text});
  
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
      child: Row(
        children: [
          Icon(
            Icons.email,
            color: Colors.teal,
          ),
          SizedBox(width: 40),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.teal
            ),
          )
        ],
      ),
    );
  }
}
