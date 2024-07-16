//Muhammad Noman Riaz
//21-Arid-4010

import 'package:flutter/material.dart';
import 'package:quiz_app/question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank QA = QuestionBank();
int correct_answers = 0;
int wrong_answers = 0;

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool _isQuizFinished = false;
  void _CheckQuestion(bool UserAnswer) {
    if (QA.Finish() == true) {
      //For last question checking
      if (QA.GetAnswer() == UserAnswer) {
        CustomIcons.add(const Icon(
          Icons.check,
          color: Colors.green,
          size: 50,
        ));
        correct_answers++;
      } else {
        CustomIcons.add(const Icon(
          Icons.close,
          color: Colors.red,
          size: 50,
        ));
        wrong_answers++;
      }
      _isQuizFinished = true;
      Future.delayed(Duration(seconds: 1), () {
        Alert(
          context: context,
          title: 'Finish Quiz',
          desc:
              'QUIZ ENDED!!\n\nCorrect Answers: $correct_answers\nWrong Answers: $wrong_answers',
        ).show().then((value) {
          // This will be called after the Alert dialog is dismissed
          setState(() {
            _isQuizFinished = false;
            correct_answers = 0;
            wrong_answers = 0;
            CustomIcons = [];
            QA.Reset();
          });
        });
      });
    } else {
      if (QA.GetAnswer() == UserAnswer) {
        CustomIcons.add(const Icon(
          Icons.check,
          color: Colors.green,
          size: 50,
        ));
        correct_answers++;
      } else {
        CustomIcons.add(const Icon(
          Icons.close,
          color: Colors.red,
          size: 50,
        ));
        wrong_answers++;
      }
      QA.nextQuestion();
    }
  }

  List<Icon> CustomIcons = [];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  QA.GetQuestion()!,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: _isQuizFinished
                        ? null
                        : () {
                            _CheckQuestion(true);
                            setState(() {});
                          },
                    child: const Text(
                      'TRUE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: _isQuizFinished
                      ? null
                      : () {
                          _CheckQuestion(false);
                          setState(() {});
                        },
                  child: const Text(
                    'FALSE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: CustomIcons,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
