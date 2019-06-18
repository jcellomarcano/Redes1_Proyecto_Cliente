import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:respues_app_redes/User/bloc/bloc_user.dart';
import 'package:respues_app_redes/api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

import 'AlertSender.dart';


class EmergencyButton extends StatefulWidget{

  final String text;
  double width = 0.0;
  double height = 0.0;
  VoidCallback onPressed;
  final String url;
  //Position position = await Geolocator().getLastKnownPosition(LocationAccuracy.high);






  EmergencyButton({Key key, @required this.text,@required this.onPressed, @required this.url, this.width, this.height});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _EmergencyButton();
  }

}

class _EmergencyButton extends State<EmergencyButton>{
  var location = new Location();
  Map<String, double> userLocation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return RaisedButton(

      onPressed: () async{
        _getLocation().then((value){
          setState(() {
            userLocation = value;
            print(userLocation);
          });
        });
        userBloc.sendAlarmData(AlertSender(
          id: 'hwiuh3872yie',
          date: '18-06-2019',
          time: '05:50:44',
          location: userLocation,
          name: 'Jesus Marcano',
          status: false,
        )).whenComplete((){
          print("Termino de enviar la data");
        });

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


  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = (await location.getLocation()) as Map<String, double>;
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

}

