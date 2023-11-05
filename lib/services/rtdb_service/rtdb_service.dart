import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:newfluchat/models/user_model.dart';

class RealDbService {
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

//Add
  Future<void> add(UserModel user) async {
    DatabaseReference ref = firebaseDatabase.ref('id/${user.id}');
    await ref.set(user.toJson());
  }

//Get
  Future<UserModel?> get() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String id = auth.currentUser!.uid;
    DatabaseReference ref = firebaseDatabase.ref('users');
    try {
      final data = await ref.child('/$id').get();
      return UserModel.fromJson(data.value);
    } catch (e, s) {
      log("Error on use: ", error: e, stackTrace: s);
      return null;
    }
  }
///update
Future<void>update(UserModel user)async{
DatabaseReference ref=firebaseDatabase.ref('user/${user.id}');
await ref.update(user.toJson());
}
Future delete(String id)async{
DatabaseReference ref=firebaseDatabase.ref('users');
await ref.child('/$id').remove();
}
}
