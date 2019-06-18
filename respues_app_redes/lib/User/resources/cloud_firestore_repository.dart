import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:respues_app_redes/AlertSender.dart';
import 'package:respues_app_redes/User/model/user.dart';
import 'package:respues_app_redes/User/resources/cloud_firestore_api.dart';

class CloudFirestoreRepository{
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> sendAlarmData(AlertSender alert) => _cloudFirestoreAPI.sendAlarmData(alert);

}