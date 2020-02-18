import 'package:cpad_lab1/Question.dart' as question;
import 'dart:math';

class SessionQuiz{
  List<int> question; //Index of all questions that will be used for quiz
  int _grade;
  int awardedPoints;
  int currentQuestion;

  sessionQuiz(int maxQuestions, [int numQuestions =5]){
    if(numQuestions>maxQuestions){
      numQuestions=maxQuestions;
    }
    var rng = new Random();
    int randomNumber;
    for(int i=0; i<numQuestions; i++){
      while(question.contains(randomNumber=rng.nextInt(maxQuestions))){ //Probably a terrible way to do this.
        question.add(randomNumber);
      }
    }
    currentQuestion=awardedPoints=0;
  }

  
}