import 'package:http/http.dart' show Client;
import 'AlertSender.dart';

class API{
  static const baseURL = 'https://en4cl2nn8qikz.x.pipedream.net';

  final Client _client = Client();

  Future<List<AlertSender>> getAlert() async{
    List<AlertSender> alertToSendList;

    final response = await _client.get(baseURL);

    alertToSendList = alertSenderFromJson(response.body) as List<AlertSender>;

    return alertToSendList;
  }
}