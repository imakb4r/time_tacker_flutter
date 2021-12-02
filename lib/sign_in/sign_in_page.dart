import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productivity_app/services/auth.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInPage extends StatefulWidget {
  EmailSignInPage({required this.auth});
  final AuthBase auth;

  @override
  State<EmailSignInPage> createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  void _submit() async {
    try {
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
      _emailController.clear();
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign In'
        : 'Create an Account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign In';
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/images/log_in.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    decoration: InputDecoration(
                        labelText: 'Email', hintText: 'test@test.com'),
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: _emailEditingComplete,
                  ),
                  TextField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: _submit,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text(
                      primaryText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: _submit,
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: _toggleFormType,
                    child: Text(
                      secondaryText,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
