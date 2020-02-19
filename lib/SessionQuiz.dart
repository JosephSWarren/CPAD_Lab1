import 'package:cpad_lab1/Question.dart';
//import 'package:cpad_lab1/main.dart' as pac1;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:cpad_lab1/McQuestion.dart' as mcq;
import 'package:cpad_lab1/SaQuestion.dart' as saq;
//import 'package:cpad_lab1/SaQuestion.dart' as SaQ;
//import 'package:cpad_lab1/mcQuestion.dart' as McQ;
//import 'dart:math';

List<Question> masterList =[];

class SessionQuiz{
  List<Question> questions; //Index of all questions that will be used for quiz
  int _grade;
  int awardedPoints;
  int currentQuestion;
  List<Question> masterList;

  SessionQuiz(List<Question> allQuestions, [int numQuestions=5]){
    questions=[];
    allQuestions.forEach((value) => questions.add(value));
    questions.shuffle;
    questions.removeRange(numQuestions, questions.length);
    currentQuestion=0;
  }

  int get getGrade{
    return _grade;
  }

  void printCurrent(){
    print('Question #${currentQuestion+1}\n${questions[currentQuestion].stem}');
  }

  void gradeQuiz(){
    questions.forEach((problem) => {    
      if(questions[currentQuestion].gradeQuestion()){
        awardedPoints+=10,
      }
    });
    _grade=(awardedPoints/(questions.length * 10)).round();
  }

  void previous(){
    if(currentQuestion==0){
      print('You are at the first question and can not go back further.');
    }
    else{
      currentQuestion-=1;
      printCurrent();
    }
  }

  void next(){
    if(currentQuestion==questions.length-1){
      print('You are already at the last question. If you are ready to submit. Type submit.');
    }
    else{
      currentQuestion+=1;
      printCurrent();
    }
  }

  bool checkCompletion(){
    var ret=true;
    var i=1;
    questions.forEach((question) => {
    if(question.response==null){
      print('question #${i} has not been answered.'),
      ret=false,
    },
    i++});
    return(ret);
  }

  void submit(){
    gradeQuiz();
    print('${getGrade}');
  }

  bool answerQuestion(var response){
    if(!questions[currentQuestion].validateInput(response)){
      return false;
    }
    next();
    return true;
  }
}

void getMasterList() async{
  
    dynamic stem;
  dynamic answer;
  dynamic option;
  
  const quizUrl='http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz0';
  for(var i=1; i<=4; i++){
    var httpResponse = await http.get(quizUrl + i.toString());
    print('${quizUrl +i.toString()}');
    var jsonMap = (json.decode(httpResponse.body));
    if(jsonMap['response']==true){
      print('${jsonMap['quiz']['name']}');
      print('${jsonMap['quiz']['question'].length}');
      jsonMap['quiz']['question'].forEach((question) => {
        if(question['type'] ==1 ){
          if(question['stem'] is String){
            stem = question['stem'],
          },
          if(question['answer'] is List<String>){
            answer = question['answer'],
          },
          if(question['option'] is int){
            option = question['option'],
          },
          masterList.add(mcq.McQuestion(stem, answer, option)),
        }
        else{
          if(question['stem'] is String){
            stem = question['stem'],
          },
          if(question['answer'] is String){
            answer=question['answer'],
          },
          masterList.add(saq.SaQuestion(stem, answer)),
        }
      });
    }
  }
  print('done');
}