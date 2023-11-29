import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: EduRightsQuiz(),
  ));
}

class EduRightsQuiz extends StatefulWidget {
  @override
  _EduRightsQuizState createState() => _EduRightsQuizState();
}

class _EduRightsQuizState extends State<EduRightsQuiz> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int? selectedOptionIndex;
  double eduRightsResult = 0.0; // Variable to store the percentage

  List<Question> questions = [
    Question(
      'You see your friend being forced to work at a mill instead of studying. What will you do?',
      [
        'A. Convince your friend to skip school and work at home.',
        'B. Report the situation to the school authorities.',
        'C. Do nothing and go to school as usual.',
        'D. Tell your friend to drop out of school and work.',
      ],
      1,
    ),
    Question(
      'Your school lacks basic facilities like clean water and toilets. What should you do?',
      [
        'A. Complain to the school authorities and parents.',
        'B. Organize a fundraiser to improve the facilities.',
        'C. Ignore the situation and adapt to it.',
        'D. Drop out of school and seek education elsewhere.',
      ],
      0,
    ),
    Question(
      'A new law is proposed that could harm students\' education rights. What can you do to protect your rights?',
      [
        'A. Discuss the issue with school authorities.',
        'B. Accept the law as it is.',
        'C. Encourage other students to accept the law.',
        'D. Inform the school authorities and parents about the situation.',
      ],
      3,
    ),
    Question(
      'Your teacher is not qualified, and the quality of education is suffering. What can you do?',
      [
        'A. Help the teacher improve their skills.',
        'B. Accept the situation and continue studying.',
        'C. Convince other students to skip school.',
        'D. Complain to the school authorities about the teacher.',
      ],
      0,
    ),
    Question(
      'Till what age do children have the right to education in India?',
      [
        'A. 16 years',
        'B. 18 years',
        'C. 14 years',
        'D. 12 years',
      ],
      2,
    ),
  ];

   void checkAnswer(int? selectedOptionIndex) {
    if (selectedOptionIndex == questions[currentQuestionIndex].correctAnswer) {
      correctAnswers++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionIndex = null;
      });
    } else {
      eduRightsResult = (correctAnswers / questions.length) * 100;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultsPage(
            correctAnswers,
            questions.length,
            eduRightsResult,
            onBack: () {
              setState(() {
                // Pass the eduRightsResult back to AgeCategory8_10Page
                Navigator.pop(context, eduRightsResult);
              });
            },
          ),
        ),
      );
    }
  }

  void resetQuiz() {
    correctAnswers = 0;
    currentQuestionIndex = 0;
    eduRightsResult = 0.0;
    selectedOptionIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Right to Education Quiz'),
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                questions[currentQuestionIndex].question,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: questions[currentQuestionIndex].options.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(questions[currentQuestionIndex].options[index]),
                  value: index,
                  groupValue: selectedOptionIndex,
                  onChanged: (int? value) {
                    setState(() {
                      selectedOptionIndex = value;
                    });
                  },
                );
              },
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                if (selectedOptionIndex != null) {
                  checkAnswer(selectedOptionIndex);
                }
              },
              child: Text('Next Question'),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}

class QuizResultsPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final double eduRightsResult;
  final Function()? onBack;

  QuizResultsPage(this.correctAnswers, this.totalQuestions, this.eduRightsResult, {this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You got $correctAnswers out of $totalQuestions questions right'),
            Text('Your score: ${eduRightsResult.toStringAsFixed(2)}%'),
            ElevatedButton(
              onPressed: () {
                if (onBack != null) {
                  onBack!(); // Call the provided onBack callback
                }
              },
              child: Text('Back to Age Category'),
            ),
          ],
        ),
      ),
    );
  }
}


