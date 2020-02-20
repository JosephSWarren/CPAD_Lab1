import 'package:cpad_lab1/Question.dart' as question;
class SaQuestion extends question.Question{ //type 2
  List<String> answer;

  SaQuestion(String stem, List<String> answer){
    this.stem=stem;
    this.answer=answer;
  }

@override
  bool gradeQuestion(){
    return answer.contains(response.toLowerCase());
  }

@override
  bool validateInput(var userResult){
    if(!(userResult is String)){
      print('Your input does not match what is expected. Please input a string/word.');
      return false;
    }
    return true;
  }

  void formatAnswer(){
    answer.forEach((element) => element=element.toLowerCase());
  }
}