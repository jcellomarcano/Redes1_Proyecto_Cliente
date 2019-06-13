import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';



class EmergencyButton extends StatefulWidget{

  var DESTINATION_ADDRESS=InternetAddress("192.168.2.1");


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _EmergencyButton(DESTINATION_ADDRESS);
  }

}

class _EmergencyButton extends State<EmergencyButton>{

  final internetAddress;

  _EmergencyButton(this.internetAddress);

  void onPressedEmergency(){
    RawDatagramSocket.bind(InternetAddress.anyIPv4, 5006).then((RawDatagramSocket udpSocket) {
      udpSocket.broadcastEnabled = true;
      udpSocket.listen((e) {
        Datagram dg = udpSocket.receive();
        if (dg != null) {
          print("received ${dg.data}");
        }
      });
      List<int> data =utf8.encode('TEST');
      udpSocket.send(data, internetAddress, 5006);
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:
      FloatingActionButton(
        backgroundColor: Color(0xFFce2029),
        mini: false,
        tooltip: "Emergency Alert",
        onPressed: onPressedEmergency,
        child: Icon(
            Icons.add_circle
        ),
      ),
    );
  }

}

