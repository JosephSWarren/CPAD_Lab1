import 'package:cpad_lab1/SessionQuiz.dart' as quiz;
//import 'dart:io';
//import 'package:cpad_lab1/Question.dart'as quest;
import 'package:cpad_lab1/McQuestion.dart' as mcq;
import 'package:cpad_lab1/SaQuestion.dart' as saq;


void main() async{
  dynamic userInput='';
  await quiz.getMasterList();
  print('hi');
  var allQuestions = quiz.masterList;
  allQuestions.forEach((element) =>{print('${element.stem}')});
  
  while(!(userInput is String) || userInput !='exit'){
    print('How many questions do you want to include in the quiz?');
    userInput ='';
    while(!(userInput is int)){
      //userInput = stdin.readLineSync();
      userInput=5;
    }
    var newQuiz= quiz.SessionQuiz(allQuestions, userInput);
    var j=0;
    newQuiz.questions.forEach((question) => {
      if(question is mcq.McQuestion){
        print('${question.stem}'),
        j=1,
        question.option.forEach((answerChoice) => {
          print('${j}) ${answerChoice}'),
          j++,
        })
        do{
          print('Type an integer from 1 to ${question.option.length} to select an answer from the options above'),
          userInput =stdin.readLineSync(),
        }while((!(userInput is int)) || userInput <0 || userInput>question.option.length),
        j=0,
        
      }
      else if(question is saq.SaQuestion){

      }
    });
  }
}


