import 'package:cpad_lab1/Question.dart'as question;
import 'package:cpad_lab1/SaQuestion.dart' as SaQ;
import 'package:cpad_lab1/mcQuestion.dart' as McQ;
import 'dart:math';

class SessionQuiz{
  List<question.Question> questions; //Index of all questions that will be used for quiz
  int _grade;
  int awardedPoints;
  int currentQuestion;

  SessionQuiz(List<question.Question> allQuestions, [int numQuestions=5]){
    questions=[];
    allQuestions.forEach((value) => questions.add(value));
    questions.shuffle;
    questions.removeRange(numQuestions, questions.length);
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
  }

  bool answerQuestion(var response){
    if(!questions[currentQuestion].validateInput(response)){
      return false;
    }
    next();
    return true;
  }
}