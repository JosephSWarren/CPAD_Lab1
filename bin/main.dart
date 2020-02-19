import 'package:http/http.dart' as http;
import 'package:cpad_lab1/McQuestion.dart' as mcq;
import 'package:cpad_lab1/SaQuestion.dart' as saq;
import 'package:cpad_lab1/SessionQuiz.dart' as quiz;
import 'package:cpad_lab1/Question.dart' as que;
import 'package:cpad_lab1/UiView.dart' as ui;
import 'dart:convert';
import 'dart:io';
//import 'dart:async';
//import 'dart:html';

void main(){
  ui.UI();
}

/*List<que.Question> masterList =[];

void main() async{
  //List<que.Question> masterList =[];
  dynamic stem;
  dynamic answer;
  dynamic option;
  
  const quizUrl='http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz0';
  for(var i=1; i<=4; i++){
    var httpResponse = await http.get(quizUrl + i.toString());
    print('${quizUrl +i.toString()}');
    var jsonMap = (json.decode(httpResponse.body));
    if(jsonMap['response']==true){
      print('${jsonMap['quiz']['name']}');
      print('${jsonMap['quiz']['question'].length}');
      jsonMap['quiz']['question'].forEach((question) => {
        if(question['type'] ==1 ){
          if(question['stem'] is String){
            stem = question['stem'],
          },
          if(question['answer'] is List<String>){
            answer = question['answer'],
          },
          if(question['option'] is int){
            option = question['option'],
          },
          masterList.add(mcq.McQuestion(stem, answer, option)),
        }
        else{
          if(question['stem'] is String){
            stem = question['stem'],
          },
          if(question['answer'] is String){
            answer=question['answer'],
          },
          masterList.add(saq.SaQuestion(stem, answer)),
        }
      });
    }
  }
  masterList.forEach((element) =>{ print('${element.stem}')});
  var newQuiz= quiz.SessionQuiz(masterList);
  print('\n\n\n\n');
  newQuiz.printCurrent();
  for(var i=0; i<10; i++){
    newQuiz.next();
  }
  try{
    var input = stdin.readLineSync();
    print('$input');
  }
  catch(e){
    print('$e');
  }

}*/