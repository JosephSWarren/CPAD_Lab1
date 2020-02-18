import 'package:cpad_lab1/Question.dart' as question;
class McQuestion extends question.Question{ //type 1
  int answer;
  List<String> option;
  int response;

  McQuestion(String newStem, this.answer, this.option){
    stem=newStem;
  }

@override
  bool gradeQuestion(){
    return response==answer;
  }

@override
  bool validateInput(var userResult){
    if(userResult.runTimeType==int){
      if(userResult>0 && userResult<=option.length){
        return true;
      }
      print('Your response is not an option. Please input an integer between 1 and ${option.length}');
      return false;
    }
    print('Your input does not match what is expected. Please input an integer.');
    return false;
  }
}