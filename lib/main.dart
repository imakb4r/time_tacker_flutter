import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productivity_app/app/landing_page.dart';
import 'package:productivity_app/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Productivity App",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
