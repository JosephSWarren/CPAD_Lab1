import 'package:cpad_lab1/Question.dart' as quest;
//import 'package:cpad_lab1/main.dart' as pac1;
import 'package:http/http.dart' as http;
import 'dart:io';
//import 'dart:async';
import 'dart:convert';
import 'package:cpad_lab1/McQuestion.dart' as mcq;
import 'package:cpad_lab1/SaQuestion.dart' as saq;
//import 'package:cpad_lab1/SaQuestion.dart' as SaQ;
//import 'package:cpad_lab1/mcQuestion.dart' as McQ;
//import 'dart:math';

class SessionQuiz {
  List<quest.Question> questions; //Index of all questions that will be used for quiz
  double _grade;
  int awardedPoints=0;
  int currentQuestion;

  SessionQuiz(List<quest.Question> allQuestions, [int numQuestions = 5]) {
    questions = [];
    allQuestions.forEach((question) => questions.add(question));
    questions.shuffle();
    questions.removeRange(numQuestions, questions.length);
    currentQuestion = 0;
    /*questions.forEach((question) =>{
      print('${question.stem}'),
      if(question is mcq.McQuestion){
        question.option.forEach((opt) =>{
          print('${opt}'),
        }),
        print('${question.answer}'),
      }
      else if(question is saq.SaQuestion){
        print('${question.answer}'),
      }
    });*/
  }

  double get getGrade {
    return _grade;
  }

  quest.Question getCurrent() {
    return questions[currentQuestion];
  }

  void printCurrent() {
    print(
        'Question #${currentQuestion + 1}\n${questions[currentQuestion].stem}');
    if (questions[currentQuestion].response != null) {
      print('Your current answer: ${questions[currentQuestion].response+1}');
    }
  }

  void gradeQuiz() {
    //var j=0;
    questions.forEach((problem) => {
                    //print('$j) ${questions[currentQuestion].gradeQuestion()}'),

          //if (questions[currentQuestion].gradeQuestion())
          if (problem.gradeQuestion())
            {
              awardedPoints++,
              //print('$j)${awardedPoints}')
            },
            //j++,
        });
    _grade = ( (awardedPoints.toDouble() / questions.length.toDouble()) * 100 );
  }

  void previous() {
    if (currentQuestion == 0) {
      print('You are at the first question and can not go back further.');
    } else {
      currentQuestion -= 1;
      printCurrent();
    }
  }

  void next() {
    if (currentQuestion == questions.length - 1) {
      if (checkCompletion()) {
        print(
            'You are already at the last question. If you are ready to submit. Type submit.');
      }
    } else {
      currentQuestion += 1;
      printCurrent();
    }
  }

  bool checkCompletion() {
    var ret = true;
    var i = 1;
    questions.forEach((question) => {
          if (question.response == null)
            {
              print('question #${i} has not been answered.'),
              ret = false,
            },
          i++
        });
        if(ret){
          print('All questions have been aswered');
        }
    return (ret);
  }

  void submit() {
    gradeQuiz();
    print('${getGrade}');
  }

  void resetQuestions(){
    questions.forEach((question)=>question.response=null);
  }

  bool answerQuestion(var response) {
    if (!questions[currentQuestion].validateInput(response)) {
      return false;
    }
    questions[currentQuestion].response=response;
    //next();
    return true;
  }

  void reviewQuiz(){
    var j=1;
    questions.forEach((problem) =>{
      if(problem is saq.SaQuestion && !problem.gradeQuestion()){
        stdout.write('$j) The correct answer(s) is/are:'),
        problem.answer.forEach((ans)=> stdout.write(' $ans')),
        print('. Your answer was: ${problem.response}'),
      },
      if(problem is mcq.McQuestion && !problem.gradeQuestion()){
        print('$j) The correct answer is: ${problem.answer+1}. Your answer was: ${problem.response+1}'),
      },
      j++
    });
  }
}