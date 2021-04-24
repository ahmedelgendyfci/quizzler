import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // ignore: non_constant_identifier_names
  List<Icon> scoreIcons = [];
  // create instance from quiz brain
  QuizBrain newQuiz = QuizBrain();

  int index = 0;
  String changeQuestion() {
    return newQuiz.getQuestionText(index);
  }

  void questionCorrection(String answer) {
    String Q_answer = newQuiz.getQuestionAnswer(index);
    log(Q_answer);
    if (Q_answer == answer) {
      // log('correct answer');
      var alertStyle = AlertStyle(
        animationType: AnimationType.grow,
        animationDuration: Duration(milliseconds: 500),
        alertAlignment: Alignment.center,
      );
      Alert(
        style: alertStyle,
        context: context,
        type: AlertType.success,
        title: "Question Correction:",
        desc: "Congratulation! Correct Answer!",
        buttons: [
          DialogButton(
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      // scoreIcons.add(
      //   Icon(
      //     Icons.check,
      //     color: Colors.green,
      //   ),
      // );
    } else {
      // log('wrong answer');
      var alertStyle = AlertStyle(
        animationType: AnimationType.grow,
        animationDuration: Duration(milliseconds: 500),
        alertAlignment: Alignment.center,
      );
      Alert(
        style: alertStyle,
        context: context,
        type: AlertType.error,
        title: "Question Correction:",
        desc: "Oops! Wrong Answer!",
        buttons: [
          DialogButton(
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      // scoreIcons.add(
      //   Icon(
      //     Icons.close,
      //     color: Colors.red,
      //   ),
      // );
    }
    setState(() {
      if (index > newQuiz.getQuestionNumbers() - 2) {
        index = 0;
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //question
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                changeQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        //true icon
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            // ignore: deprecated_member_use
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                questionCorrection('true');
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        //false icon
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            // ignore: deprecated_member_use
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                questionCorrection('false');
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
          child: Row(
            children: scoreIcons,
          ),
        )
      ],
    );
  }
}
