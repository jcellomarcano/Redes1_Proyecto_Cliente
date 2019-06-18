import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:respues_app_redes/AlertSender.dart';
import 'package:respues_app_redes/User/model/user.dart';

class CloudFirestoreAPI {

  final String USERS = "users";
  final String ALARMS = "alarms-data";

  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email
    }, merge: true);
  }


  Future<void> sendAlarmData(AlertSender alert) async{
    CollectionReference refAlarm = _db.collection(ALARMS);
    await refAlarm.add({
      'id': alert.id,
      'date': alert.date,
      'time': alert.time,
      'location': alert.location,
      'name': alert.name,
      'status': alert.status,
    });
  }

}