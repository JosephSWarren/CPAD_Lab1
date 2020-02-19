
class Question{
  String stem;
  var response;
  var answer;

  Question.named(this.stem, this.response, this.answer);

  Question(){
    stem= 'my question';
    answer= 'yes';
  }

  bool validateInput(var userResult){
return true;
  }

  bool gradeQuestion(){
return true;
  }

}