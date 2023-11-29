import 'package:flutter/material.dart';
import 'package:rights_quiz/pages/register.dart';
import 'package:rights_quiz/components/app_theme.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  void loginWithEmail() {
    final email = emailController.text;

    if (email.isEmpty) {
      showAlertDialog('Enter a valid email');
      return;
    }

    if (email.isNotEmpty) {
      // Navigate to the home page when the "Login" button is pressed.
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // Show "Enter valid credentials" alert
      showAlertDialog('Enter valid credentials');
    }
  }

  void showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              constraints: BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  Text(
                    'Rights Rise',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                    ),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib\assets\tcelogo.jpeg'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: passwordController,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: loginWithEmail,
                          style: ElevatedButton.styleFrom(
                            primary: AppTheme.darkText,
                            onPrimary: AppTheme.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the register page when the "Register" button is pressed.
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppTheme.darkText,
                            onPrimary: AppTheme.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Login with',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.darkText,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle Google login logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFDD4B39),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    icon: Icon(
                      IconData(0xe905, fontFamily: 'GFSocialFonts'),
                      color: AppTheme.white,
                      size: 20,
                    ),
                    label: Text(
                      'Google +',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
