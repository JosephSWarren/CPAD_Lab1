import 'package:cpad_lab1/Question.dart' as question;
import 'dart:math';

class SessionQuiz{
  List<int> question; //Index of all questions that will be used for quiz
  int _grade;
  int currentQuestion;

  sessionQuiz(int maxQuestions, [int numQuestions =5]){
    if(numQuestions>maxQuestions){
      numQuestions=maxQuestions;
    }
    var rng = new Random();
    for(int i=0; i<numQuestions; i++){
      question.append

    }
  }
}