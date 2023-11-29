import 'package:flutter/material.dart';
import '../components/app_theme.dart'; // Import your theme
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  void register() {
    // Implement your registration logic here

    // Check if email and name are not empty
    if (emailController.text.isNotEmpty && nameController.text.isNotEmpty) {
      // Check if password and repeat password match
      if (passwordController.text == repeatPasswordController.text) {
        // Registration successful
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registration Successful'),
              content: Text('You are now registered.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Passwords don't match alert
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registration Error'),
              content: Text('Passwords do not match.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Empty email or name alert
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Error'),
            content: Text('Please enter your email and name.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
              ],
            
          );
        },
      );
    }
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
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('../assets/tcelogo.png'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate back to login page
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.deactivatedText,
                      ),
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email Address'),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  TextField(
                    controller: repeatPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Repeat Password'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: register,
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

                  // "Login with Google" container
                  Text(
                    'Register with',
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
