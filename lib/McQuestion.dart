import 'package:cpad_lab1/Question.dart' as question;
class McQuestion extends question.Question{ //type 1
  List option;
  int answer;

  McQuestion(String stem, answer, this.option){
    this.answer=answer-1;
    this.stem=stem;
  }

@override
  bool gradeQuestion(){
    //print('mc) $response vs $answer');
    return response==answer;
  }

@override
  bool validateInput(var userResult){
    if(userResult is int){
      if(userResult>=0 && userResult<option.length){
        //print('${userResult} ${userResult>0} ${userResult<=option.length}');
        return true;
      }
      print('Your response is not an option. Please input an integer between 1 and ${option.length}');
      return false;
    }
    print('Your input does not match what is expected. Please input an integer.');
    return false;
  }
}