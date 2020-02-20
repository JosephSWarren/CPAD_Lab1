
class Question{
  String stem;
  dynamic response;

  Question.named(this.stem, this.response);

  Question(){
    
  }

  bool validateInput(var userResult){
return true;
  }

  bool gradeQuestion(){
return true;
  }

}