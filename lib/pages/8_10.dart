import 'package:flutter/material.dart';

class AgeCategory8_10Page extends StatefulWidget {
  @override
  _AgeCategory8_10PageState createState() => _AgeCategory8_10PageState();
}

class _AgeCategory8_10PageState extends State<AgeCategory8_10Page> {
  double lastQuizResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('8-10 Age Category'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the 8-10 age category!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Select a Legal System Topic:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            LegalSystemTopicButton(
              topic: 'Right to Education',
              iconData: Icons.school, // Default icon for education
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/8_10/right_to_education',
                  arguments: lastQuizResult,
                );
              },
              lastQuizResult: lastQuizResult,
            ),
            SizedBox(height: 10),
            LegalSystemTopicButton(
              topic: 'Child Protection Laws',
              iconData: Icons.security, // Default icon for security
              onPressed: () {
                Navigator.pushNamed(context, '/8_10/child_protection_laws');
              },
            ),
            SizedBox(height: 10),
            LegalSystemTopicButton(
              topic: 'Healthcare Rights',
              iconData: Icons.local_hospital, // Default icon for healthcare
              onPressed: () {
                Navigator.pushNamed(context, '/8_10/healthcare_rights');
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class LegalSystemTopicButton extends StatelessWidget {
  final String topic;
  final IconData iconData;
  final VoidCallback onPressed;
  final double? lastQuizResult;

 LegalSystemTopicButton({
  required this.topic,
  required this.iconData,
  required this.onPressed,
  this.lastQuizResult,
});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          padding: EdgeInsets.all(20),
        ),
        icon: Icon(
          iconData,
          size: 40,
        ),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              topic,
              style: TextStyle(fontSize: 20),
            ),
            if (lastQuizResult != null)
              Text(
              'Progress: ${lastQuizResult?.toStringAsFixed(2) ?? 'N/A'}%',
              style: TextStyle(fontSize: 16),
                ),
          ],
        ),
      ),
    );
  }
}
