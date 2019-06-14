import 'package:flutter/material.dart';
import 'package:respues_app_redes/api.dart';

import 'AlertSender.dart';

class CommingAlert extends StatelessWidget{
  final API api = API();

  @override


  Widget build(BuildContext context) {

    FutureBuilder<List<AlertSender>>(
      future: api.getAlert(),
      builder: (BuildContext context, AsyncSnapshot<List<AlertSender>> snapshot){
        if ( snapshot.hasData && snapshot.connectionState == ConnectionState.done){
          return ListView.builder(itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return Card (
                  child: ListTile(
                    title: Text(snapshot.data[index].id.toString()),
                  ),
                );
              });
        }else{
          return CircularProgressIndicator();
        }
      },
    );
  }

}