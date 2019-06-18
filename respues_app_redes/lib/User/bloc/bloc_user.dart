import 'package:flutter/material.dart';
import 'package:respues_app_redes/User/model/user.dart';
import 'package:respues_app_redes/User/resources/cloud_firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../AlertSender.dart';

class UserBloc implements Bloc{
  @override
  void dispose() {
    // TODO: implement dispose
  }

  //final _auth_repository = AuthRepository();

  //final _auth_repository = AuthRepository();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;


  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);


  Future<void> sendAlarmData(AlertSender alert) => _cloudFirestoreRepository.sendAlarmData(alert);

}