import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfluchat/constants/main_color.dart';
import 'package:newfluchat/models/user_model.dart';
import 'package:newfluchat/services/rtdb_service/rtdb_service.dart';
import 'package:newfluchat/utils/app-id-generator.dart';
import 'package:newfluchat/utils/app_loader.dart';
import 'package:newfluchat/widgets/main_button.dart';
import 'package:newfluchat/widgets/textfeilds.dart';

import '../services/firebase_service/fb_storage.dart';

class UserInfoPage extends StatefulWidget {
  static const String id = 'UserInfo';

  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfoPage> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final nicknameController = TextEditingController();
  final bioController = TextEditingController();
  // String path = "";
  // String photoUrl = "vcvxvxvxzcc";

  // void imagePick() async {
  //   await imagePicker
  //       .pickImage(
  //     source: ImageSource.gallery,
  //   )
  //       .then((value) {
  //     if (value != null) {
  //       path = value.path;
  //     }
  //   });
  // }
  void databaseAdding() async {
    showLoader(context);
    FirebaseAuth auth=FirebaseAuth.instance;
    final userId=auth.currentUser!.uid;
    RealDbService dbService = RealDbService();
    FirebaseStorageServices storageService=FirebaseStorageServices();
    // final imageUrl=await storageService.upload(File(path));
    UserModel userModel = UserModel(
      id: userId,
      name: nameController.text.trim(),
      surname: surnameController.text.trim(),
      nickname: nicknameController.text.trim(),
      // photoUrl: imageUrl??"",
      online: true,
      lastSeen: Token.now(),
      bio: bioController.text.trim(),
    );
    dbService.add(userModel).then((value){
      Navigator.pop(context);
      Navigator.pushNamed(context, 'home');
    });
    log('joylandi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: mainColor, width: 2),
                    // image: path.isNotEmpty
                    //     ? DecorationImage(
                    //   image: FileImage(
                    //     File(path),
                    //   ),
                    )
                        // : null,
                  ),
                  // child: path.isEmpty ? const Icon(Icons.add_a_photo_outlined,
                  //   size: 40,
                  // ) : null,
                ),
              const SizedBox(
                height: 30,
              ),
              TextFields(
                  controller: nameController, text: 'Isminigizni kiriting'),
              const SizedBox(
                height: 15,
              ),
              TextFields(controller: surnameController,
                  text: 'Familiyangizni kiriting'),
              const SizedBox(
                height: 15,
              ),
              TextFields(
                  controller: nicknameController, text: 'Username kiriting'),
              const SizedBox(
                height: 15,
              ),
              TextFields(controller: bioController, text: "Bio"),
              const SizedBox(
                height: 30,
              ),
              MainButton(title: 'Tasdiqlash', onPressed: databaseAdding,),
            ],
          ),
        ),
      ),
    );
  }
}
