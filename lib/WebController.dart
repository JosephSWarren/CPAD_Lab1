import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class WebController{
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