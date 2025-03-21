import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzler'),
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionBank[currentQuestionIndex].questionAnswer;

    if (userPickedAnswer == correctAnswer) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      score++;
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }

    setState(() {
      if (currentQuestionIndex < questionBank.length - 1) {
        currentQuestionIndex++;
      } else {
        Alert(
          context: context,
          style: AlertStyle(isCloseButton: false, isOverlayTapDismiss: false),
          type: AlertType.success,
          title: 'Finished!',
          desc:
              'You\'ve reached the end of the quiz.\nScore: $score/${questionBank.length}',
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pushNamed(context, "/"),
              width: 120,
              color: Colors.red,
              child: Text(
                'Go back',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            DialogButton(
              onPressed: () => {
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  scoreKeeper = [];
                }),
                Navigator.pop(context),
              },
              width: 120,
              color: Colors.green,
              child: Text(
                'Restart',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[currentQuestionIndex].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(children: scoreKeeper),
      ],
    );
  }
}

class Question {
  String questionText;
  bool questionAnswer;

  Question(this.questionText, this.questionAnswer);
}

List<Question> questionBank = [
  Question('The Great Wall of China is visible from space with the naked eye', false),
  Question('Goldfish have a memory span of only three seconds', false),
  Question('The human body has four lungs', false),
  Question('Mount Everest is the tallest mountain in the solar system', false),
  Question('A day on Venus is longer than a year on Venus', true),
  Question('Humans share 50% of their DNA with bananas', true),
  Question('The shortest war in history lasted just 38 minutes', true),
  Question('Lightning never strikes the same place twice', false),
  Question('Honey is the only food that never spoils', true),
  Question('The Eiffel Tower can be 15 cm taller during the summer', true),
  Question('Australia was originally established as a penal colony', true),
  Question('The average person will spend six months of their life waiting at red lights', true),
  Question('Octopuses have three hearts', true),
  Question('A group of flamingos is called a "flamboyance"', true),
  Question('The speed of sound is faster in water than in air', true),
];
