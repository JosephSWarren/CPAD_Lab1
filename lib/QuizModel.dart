import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

// Type 1 = multiple choice and True/False
// Type 2 = fill in the blank; so there is no "option:" JSON in this

Future<Quiz> fetchquiz() async {
  final response = await http.get('http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return Quiz.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load quiz');
  }
}

class Quiz {
  final int userId;
  final int id;
  final String title;

  Quiz({this.userId, this.id, this.title});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
