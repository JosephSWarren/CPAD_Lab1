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
    while((!(userInput is int)) || userInput <1 || userInput>allQuestions.length){
      userInput = int.parse(stdin.readLineSync());
    }
    var newQuiz= quiz.SessionQuiz(allQuestions, userInput);
    var j=0;
    newQuiz.printCurrent();
    while(!(userInput is String) || userInput!='submit'){
      question = newQuiz.getCurrent();
      if(question is mcq.McQuestion){
        j=1;
        print('${question.option}');
        question.option.forEach((answerChoice) => {
          print('${j}) ${answerChoice}'),
          j++,
        });
        do{
          print('Type an integer from 1 to ${question.option.length} to select an answer from the options above');
          userInput =int.parse('${stdin.readLineSync()}');
        }while(!question.validateInput(userInput));
        newQuiz.answerQuestion(userInput-1);
      }
      else if(question is saq.SaQuestion){
        do{
          print('Type a string that fills in the blank above.');
          userInput=stdin.readLineSync();
        }while(!question.validateInput(userInput));
        newQuiz.answerQuestion(userInput);
      }
    }
    print('Type exit to stop taking quizzes, or press enter to create a new quiz.');
    while(!(userInput is String)){
      userInput =stdin.readLineSync;
    }
  }
}


