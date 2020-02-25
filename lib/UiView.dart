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
    while(userInput is String || userInput <1 || userInput>allQuestions.length){
      userInput = stdin.readLineSync();
      if(intParsable(userInput)){
        userInput=int.parse(userInput);
      }
    }
    var newQuiz= quiz.SessionQuiz(allQuestions, userInput);
    newQuiz.resetQuestions();
    var j=0;
    print('-------------------------------------------------------------------------------');
    newQuiz.printCurrent();
    while(!(userInput is String) || userInput!='submit'){
      question = newQuiz.getCurrent();
      if(question is mcq.McQuestion){
        j=1;
        //print('${question.option}');
        question.option.forEach((answerChoice) => {
          print('${j}) ${answerChoice}'),
          j++,
        });
        do{
          print('Type an integer from 1 to ${question.option.length} to select an answer from the options above');
          userInput = stdin.readLineSync();
        }while(!intParsable(userInput) || !question.validateInput(int.parse(userInput)-1));
        userInput=int.parse(userInput);
        newQuiz.answerQuestion(userInput-1);
      }
      else if(question is saq.SaQuestion){
        do{
          print('Type a string that fills in the blank above.');
          userInput=stdin.readLineSync();
        }while(!question.validateInput(userInput));
        newQuiz.answerQuestion(userInput);
      }
      do{
        print('-------------------------------------------------------------------------------');
        print("Type 'previous' or 'next' to navigate to other questions, or 'submit' to end quiz and get grade");
        userInput=stdin.readLineSync();
      }while(userInput!='previous' && userInput!='next' && userInput!='submit');
      print('-------------------------------------------------------------------------------');
      if(userInput=='next'){
        newQuiz.next();
      }else if(userInput=='previous'){
        newQuiz.previous();
      }
}
    newQuiz.gradeQuiz();
    print('${newQuiz.getGrade}');
    print('Type exit to stop taking quizzes, review to see what questions you got wrong, or press enter to create a new quiz.');
    userInput=0;
    while(!(userInput is String) || userInput==null){
      userInput =stdin.readLineSync();
    }
    if(userInput=='review'){
      newQuiz.reviewQuiz();
      print('Type exit to stop taking quizzes, or press enter to create a new quiz.');
      userInput=stdin.readLineSync();
    }
    if(userInput == 'exit'){
      exit(1);
    }
  }
}

bool intParsable(String input){
  if(input.isEmpty){
    return false;
  }
  for(var i=0; i<input.length; i++){
    var char = input.codeUnitAt(i);
    if(char<48 || char >57){
      return false;
    }
  }
  return true;
}


