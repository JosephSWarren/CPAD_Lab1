import 'package:cpad_lab1/Question.dart' as question;
class mCProblem extends question.Question{ //type 1
  int answer;
  List<String> option;

  mCProblem(String newStem, this.answer, this.option){
    stem=newStem;
  }

  bool gradeQuestion(int userResult){
    return userResult==answer;
  }

  bool validateInput(var userResult){
    if(userResult.runTimeType==int){
      return userResult>0 && userResult<=option.length;
    }
    return false;
  }
}