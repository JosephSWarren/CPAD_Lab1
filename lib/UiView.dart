import 'WebController.dart';

void main() {

  WebController webClient = new WebController();
  Future <WebController> futureWebClient = webClient.parseJson(webClient.getURL());
  print(futureWebClient.toString());
  //webClient.setQuizResponse();
 // print(webClient.getQuizResponse());


/*
  do {
    WebController webClient = new WebController();
    
  } while(webClient.getResponse());
*/
}


