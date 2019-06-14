import 'package:flutter/material.dart';
import 'package:respues_app_redes/api.dart';

import 'AlertSender.dart';


class EmergencyButton extends StatefulWidget{

  final String text;
  double width = 0.0;
  double height = 0.0;
  VoidCallback onPressed;
  final String url;

  EmergencyButton({Key key, @required this.text,@required this.onPressed, @required this.url, this.width, this.height});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _EmergencyButton();
  }

}

class _EmergencyButton extends State<EmergencyButton>{

  final API api = new API()

  void onPressedEmergency(){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Haz Haz enviado un llamado de emergencia"),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return RaisedButton(
      onPressed: () async{
        AlertSender alarm = new AlertSender(
          id: "298", time: "07:00:00", date: "14-06-2019", location: "Caracas"
        );
        await api.postSendAlert(url: 'http://redesapp.herokuapp.com/', body:  );

      },
      child: Container(

        child: Icon(
            Icons.add_circle
        ),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color(0xFFce2029),
        ),
      )
    );
  }

}

