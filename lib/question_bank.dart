//Muhammad Noman Riaz
//21-Arid-4010

import 'package:quiz_app/question.dart';

class QuestionBank {
  int count = 0;
  List<Questions> questionbanks = [
    Questions(
        'Is Artificial Intelligence about playing a game on a computer?', true),
    Questions(' Blind search can be used in complex games', false),
    Questions(
        'Expert systems, gaming, and vision systems are applications of AI',
        true),
    Questions(
        'Depth-First Search requires less memory compared to Breadth-First Search',
        true),
    Questions(
        'A robot that can change its trajectory based on external conditions is considered intelligent',
        true),
    Questions('Python is commonly used for AI', true),
    Questions(
        'The Turing Test was developed to determine whether a machine can demonstrate artificial intelligence',
        true),
    Questions(
        'The components of an Expert system include the knowledge base, inference engine, and user interface',
        true),
    Questions(
        'The Min/Max algorithm is used in game trees to make decisions about win/lose outcomes',
        true),
    Questions(
        'There are four ways to solve a state-space search problem', false),
    Questions(
        'Inferential Efficiency is a required property of knowledge representation',
        false),
    Questions(
        'AI agents perceive and act upon the environment using sensors and actuators',
        true),
    Questions('Simple reflex agents follow the condition-action rule', true),
    Questions('Utility-based agents deal with happy and unhappy states', true),
    Questions('Rational agents always do the right things', true),
    Questions(
        'Heuristic processing enables computers to understand associations and relationships between objects and events',
        false),
    Questions(
        'The exploration problem occurs when an agent lacks knowledge of both state and actions',
        true),
    Questions('Is machine learning a subset of artificial intelligence?', true),
    Questions(
        'Convolutional Neural Networks (CNNs) are commonly used for image recognition tasks',
        true),
    Questions(
        'Reinforcement learning is a type of unsupervised learning', false),
  ];
  void nextQuestion() {
    if (count <= questionbanks.length - 1) {
      count++;
    }
  }

  String? GetQuestion() {
    return questionbanks[count].QuestionState;
  }

  bool? GetAnswer() {
    return questionbanks[count].AnswerState;
  }

  bool? Finish() {
    if (count >= questionbanks.length - 1)
      return true;
    else {
      return false;
    }
  }

  void Reset() {
    count = 0;
  }
}
