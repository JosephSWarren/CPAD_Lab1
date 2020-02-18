import 'package:cpad_lab1/Question.dart' as question;
class mCProblem extends question.Question{ //type 1
  int answer;
  List<String> option;

  mCProblem(String newStem, this.answer, this.option){
    stem=newStem;
  }

@override
  bool gradeQuestion(var userResult){
    return userResult==answer;
  }

@override
  bool validateInput(var userResult){
    if(userResult.runTimeType==int){
      return userResult>0 && userResult<=option.length;
    }
    return false;
  }
}