import 'package:cpad_lab1/Question.dart' as question;
import 'package:cpad_lab1/SaQuestion.dart' as SaQ;
import 'package:cpad_lab1/mcQuestion.dart' as McQ;
import 'dart:math';

class SessionQuiz{
  List<question.Question> questions; //Index of all questions that will be used for quiz
  int _grade;
  int awardedPoints;
  int currentQuestion;

  /*sessionQuiz(List<question.Question> questions, [int numQuestions =5]){
    var maxQuestions = question.length;
    if(numQuestions>maxQuestions){
      numQuestions=maxQuestions;
    }
    var rng = new Random();
    int randomNumber;
    for(var i=0; i<numQuestions; i++){
      while(question.contains(randomNumber=rng.nextInt(maxQuestions))){ //Probably a terrible way to do this.
        question.add(randomNumber);
      }
    }
    currentQuestion=awardedPoints=0;
  }*/

  SessionQuiz(List<question.Question> allQuestions, [int numQuestions=5]){
    questions=[];
    allQuestions.forEach((value) => questions.add(value));
    questions.shuffle;
    questions.removeRange(numQuestions, questions.length);
  }

  void printCurrent(){
    print('Question #${currentQuestion}\n${questions[currentQuestion].stem}');
  }

  void gradeQuiz(var response){
    questions.forEach((problem) => {    
      if(questions[currentQuestion].gradeQuestion(response)){
        awardedPoints+=10,
      }
    });
    _grade=(awardedPoints/(questions.length * 10)).round();
  }

  
}