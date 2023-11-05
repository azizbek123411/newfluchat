
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newfluchat/constants/main_color.dart';
import 'package:newfluchat/pages/home_page/home_page.dart';
import 'package:newfluchat/services/auth_service/firebase_atuh_service.dart';
import 'package:newfluchat/utils/app_loader.dart';
import 'package:newfluchat/utils/app_toast.dart';
import 'package:newfluchat/widgets/main_button.dart';
import 'package:newfluchat/widgets/textfeilds.dart';

import '../../utils/navigators.dart';

class SignIn extends StatefulWidget {
  static const String id = 'signIn';

  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void signIn()async{
    AuthService authService=AuthService();
    final email=emailController.text.trim();
    final password=passwordController.text.trim();
    showLoader(context);
    authService.signIn(email, password).then((value){
      Go(context).close();
      if(value){
        showToast(context: context, message:"Kirish muvafaqqiyatli o'tkazildi!");
        Go(context).id(HomePage.id);
      }else{
        showToast(context: context, message:"Xatolik yuz berdi!");
      }
    });
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
                height: 130,
              ),
              const Text(
                "Kirish",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFields(
                controller: emailController,
                text: 'Emailni kiriting',
              ),
              const SizedBox(
                height: 40,
              ),
              TextFields(
                controller: passwordController,
                text: 'Passwordni kiritng',
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 40,
              ),
              MainButton(title: "Kirish", onPressed: signIn),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                    text: "Akkauntigiz yo'qmi ?",
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(
                          text: "Ro'yxatdan o'tish",
                          style: const TextStyle(color: mainColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            }),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
