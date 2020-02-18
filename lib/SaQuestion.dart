import 'package:cpad_lab1/Question.dart' as question;
class SaQuestion extends question.Question{ //type 2
  List<String> answer;

  SaQuestion(stem, this.answer){
    stem=this.stem;
  }

@override
  bool gradeQuestion(var userResult){
    return answer.contains(userResult.toLowerCase());
  }

@override
  bool validateInput(var userResult){
    return userResult.runTimeType==String;
  }

  void formatAnswer(){
    answer.forEach((element) => element=element.toLowerCase());
  }
}