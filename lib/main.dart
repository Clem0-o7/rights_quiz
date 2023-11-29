import 'package:flutter/material.dart';
import 'package:rights_quiz/pages/login.dart'; 
import 'package:rights_quiz/pages/home.dart'; 
import 'package:rights_quiz/pages/register.dart'; 
import 'package:rights_quiz/pages/edu_rights.dart'; 

// Import the age category pages
import 'package:rights_quiz/pages/8_10.dart';
import 'package:rights_quiz/pages/11_13.dart';
import 'package:rights_quiz/pages/14_16.dart';

void main() {
  runApp(RightsRiseApp());
}

class RightsRiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rights Rise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', 
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),

        // Add the age category routes
        '/8_10': (context) => AgeCategory8_10Page(),
        '/11_13': (context) => AgeCategory11_13Page(),
        '/14_16': (context) => AgeCategory14_16Page(),

        //Topics Rooutes
         '/8_10/right_to_education': (context) => EduRightsQuiz(),
      },
    );
  }
}
