import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//import 'dart:html';

main() {
  
  const quizUrl='http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz01';
  var httpResponse = await http.get(quizUrl);
  var json = (json.decode(httpResponse.body));

}