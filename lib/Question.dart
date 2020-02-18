
class Question{
  String stem;

  Question(){

  }

  Question(Map<String, dynamic> jsonQuestion){
    if(jsonQuestion.containsKey("type") && jsonQuestion["type"]==1{
      return mcQuestion(jsonQuestion["stem"], jsonQuestion["answer"], jsonQuestion["option"]);
    }
  }


}