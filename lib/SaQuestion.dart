import 'package:cpad_lab1/Question.dart' as question;
class SaQuestion extends question.Question{ //type 2
  List<String> answer;

  SaQuestion(stem, this.answer){
    stem=this.stem;
  }

  bool gradeQuestion(String userResult){
    return answer.contains(userResult.toLowerCase());
  }

  void formatAnswer(){
    answer.forEach((element) => element=element.toLowerCase());
  }
}