import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Rights Rise!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Select an Age Category:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            AgeCategoryGridView(),
          ],
        ),
      ),
    );
  }
}

class AgeCategoryGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        AgeCategoryButton(
          ageCategory: '8-10',
          iconData: Icons.child_care,
          onPressed: () {
            Navigator.pushNamed(context, '/8_10');
          },
        ),
        SizedBox(height: 10),
        AgeCategoryButton(
          ageCategory: '11-13',
          iconData: Icons.child_care,
          onPressed: () {
            Navigator.pushNamed(context, '/11_13');
          },
        ),
        SizedBox(height: 10),
        AgeCategoryButton(
          ageCategory: '14-16',
          iconData: Icons.child_care,
          onPressed: () {
            Navigator.pushNamed(context, '/14_16');
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class AgeCategoryButton extends StatelessWidget {
  final String ageCategory;
  final IconData iconData; // Icon data for the button
  final VoidCallback onPressed;

  AgeCategoryButton({required this.ageCategory, required this.iconData, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // Change the button color to your preference
          padding: EdgeInsets.all(20), // Add padding to make the buttons large
        ),
        icon: Icon(
          iconData, // Default icon from Icons class
          size: 40, // Adjust the icon size as needed
        ),
        label: Text(
          ageCategory,
          style: TextStyle(fontSize: 20), // Adjust the font size as needed
        ),
      ),
    );
  }
}
