// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LLamado de Emergencia',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Llamado de emergencia'),
        ),
        body: EmergencyButton(),
      ),
    ),
  );
}

class EmergencyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            FloatingActionButton(
              onPressed: () {
                //Do something
              },
              elevation: 8,
              highlightElevation: 2,
              shape: CircleBorder(),
              child: Icon(Icons.directions_car,),
              backgroundColor: Colors.pink,
              mini: false,
            ),
            Container(
              color: Colors.blue,
              child: FlutterLogo(
                size: 60.0,
              ),
            ),
            Container(
              color: Colors.purple,
              child: FlutterLogo(
                size: 60.0,
              ),
            ),
          ],
        )
    );
  }
}



