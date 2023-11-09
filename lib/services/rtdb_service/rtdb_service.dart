import 'dart:developer';
import 'dart:ffi';

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
    DatabaseReference ref = firebaseDatabase.ref('id');
    try {
      final data = await ref.child('/$id').get();
      return UserModel.fromJson(data.value);
    } catch (e, s) {
      log("Error on use: ", error: e, stackTrace: s);
      return null;
    }
  }

  ///update
  Future<void> update(UserModel user) async {
    DatabaseReference ref = firebaseDatabase.ref('id/${user.id}');
    await ref.update(user.toJson());
  }

  Future delete(String id) async {
    DatabaseReference ref = firebaseDatabase.ref('id');
    await ref.child('/$id').remove();
  }

  Future<UserModel?> getUser(String nickname) async {
    UserModel? findUser;
    DatabaseReference ref = firebaseDatabase.ref('id');
    try {
      DataSnapshot event = await ref.get();
      var map=event.value as Map;
      map.forEach((key, value) {
        UserModel? userModel;
        try{
          userModel=UserModel.fromJson(value);
        }catch(error){
          log('parsing error:',error: error);
        }
        if(userModel!=null){
          if(userModel.nickname==nickname){
            findUser=userModel;
          }
        }
      });
      log(event.value.toString());
      // return UserModel.fromJson(event.value);
    } catch (e) {
      log("Searching error:", error: e);
      return null;
    }
    return findUser;
  }

// Future<UserModel?> searchUser(String username) async {
//   DatabaseReference ref=firebaseDatabase.ref('id');
//   Query query=ref.orderByChild('username').startAt(username);
// }
}
