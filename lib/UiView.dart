import 'package:cpad_lab1/SessionQuiz.dart' as quiz;
import 'dart:io';
import 'package:cpad_lab1/Question.dart'as que;
import 'package:cpad_lab1/McQuestion.dart' as mcq;
import 'package:cpad_lab1/SaQuestion.dart' as saq;
import 'package:cpad_lab1/WebController.dart' as wc;

void UI() async{
  dynamic userInput='';
  var controller = wc.WebController();
  await controller.createMasterList();
  var allQuestions = controller.getMasterList;
  que.Question question;
  //allQuestions.forEach((element) =>{print('${element.stem}')});
  
  while(!(userInput is String) || userInput !='exit'){
    print('How many questions do you want to include in the quiz?');
    userInput ='';
    while(!(userInput is int)){
      userInput = stdin.readLineSync();
    }
    var newQuiz= quiz.SessionQuiz(allQuestions, userInput);
    var j=0;
    while(!(userInput is String) || userInput!='submit'){
      question = newQuiz.getCurrent();
      if(question is mcq.McQuestion){
        print('${question.stem}');
        j=1;
        question.option.forEach((answerChoice) => {
          print('${j}) ${answerChoice}'),
          j++,
        });
        do{
          print('Type an integer from 1 to ${question.option.length} to select an answer from the options above');
          userInput =stdin.readLineSync();
        }while((!(userInput is int)) || userInput <1 || userInput>question.option.length);
        //question.answerQues
        
      }
      else if(question is saq.SaQuestion){

      }
    }
    print('Type exit to stop taking quizzes, or press enter to create a new quiz.');
    while(!(userInput is String)){
      userInput =stdin.readLineSync;
    }
  }
}


