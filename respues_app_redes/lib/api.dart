import 'package:http/http.dart' show Client;
import 'AlertSender.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API{
  static const baseURL = 'http://redesapp.herokuapp.com/';


  final Client _client = Client();

  Future<List<AlertSender>> getAlert() async{
    List<AlertSender> alertToSendList;

    final response = await _client.get(baseURL);

    alertToSendList = alertSenderFromJson(response.body) as List<AlertSender>;

    return alertToSendList;
  }


  Future<AlertSender> postSendAlert({AlertSender body, String url}) async{
    return http.post(url, body: body.toJson()).then((http.Response response){
      final int statusCode = response.statusCode;

      if (statusCode != 200 || statusCode != 400 || json == null){
        print(statusCode);
        print(url + "\n" + body.toJson().toString() + "\n" + response.body.toString());
        throw new Exception("Error while fetching data");
      }
      print(response.body);
      print(body);
      return alertSenderFromJson(response.body);
    });
  }
}