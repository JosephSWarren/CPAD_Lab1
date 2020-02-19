//import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:cpad_lab1/Question.dart' as quest;
import 'package:cpad_lab1/McQuestion.dart' as mcq;
import 'package:cpad_lab1/SaQuestion.dart' as saq;

class WebController {
  List<quest.Question> _masterList;

  WebController(){
    _masterList=[];
  }

  List<quest.Question> get getMasterList{
    return _masterList;
  }

  void createMasterList() async {
    dynamic stem;
    dynamic answer;
    dynamic option;

    const quizUrl = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz0';
    for (var i = 1; i <= 4; i++) {
      var httpResponse = await http.get(quizUrl + i.toString());
      //print('${quizUrl + i.toString()}');
      var jsonMap = (json.decode(httpResponse.body));
      if (jsonMap['response'] == true) {
        //print('${jsonMap['quiz']['name']}');
        //print('${jsonMap['quiz']['question'].length}');
        jsonMap['quiz']['question'].forEach((question) => {
              if (question['type'] == 1)
                {
                  if (question['stem'] is String)
                    {
                      stem = question['stem'],
                    },
                  if (question['answer'] is List<String>)
                    {
                      answer = question['answer'],
                    },
                  if (question['option'] is int)
                    {
                      option = question['option'],
                    },
                  _masterList.add(mcq.McQuestion(stem, answer, option)),
                }
              else
                {
                  if (question['stem'] is String)
                    {
                      stem = question['stem'],
                    },
                  if (question['answer'] is String)
                    {
                      answer = question['answer'],
                    },
                  _masterList.add(saq.SaQuestion(stem, answer)),
                }
            });
      }
    }
    //print('done');
  }
}

/*class WebController{
  static int quizNumberInt = 1;
  String quizNumberString;
  String url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz';
  var jsonData;
  static var parsedJson;
  static var quizResponse;
  var questionType;
  var questionStem;
  var questionAnswer;
  var questionOption;


  WebController(){
    if(quizNumberInt < 10){
      quizNumberString = '0' + quizNumberInt.toString();
    }
    else{
      quizNumberString = quizNumberInt.toString();
    }
    url = url + quizNumberString;
    quizNumberInt++;
  }

  Future <WebController> parseJson(url) async {
      jsonData = await http.get(getURL());
    parsedJson = json.decode(jsonData.body);

    print(parsedJson['quiz']['question'][0]);
  }

  String getURL(){
    return url;
  }

  String getQuizResponse(){
    return quizResponse;
  }

  void setQuizResponse(){
    //quizResponse = parsedJson['response'];
    //print(quizResponse);
  }

}

/*
 // List<String> quiz1 = ["This is question 1?","This is question 2?"];
 // List<String> quiz2 = ["This is question 3?","This is question 4?"];
 // List<String> quiz3 = ["This is question 5?","This is question 6?"];
 // var practiceQuiz = [...quiz1?...quiz2?...quiz3];
  //print(practiceQuiz);

  var answer = stdin.readLineSync();


}*/
*/
