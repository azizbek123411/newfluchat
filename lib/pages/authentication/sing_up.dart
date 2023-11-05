import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newfluchat/constants/main_color.dart';
import 'package:newfluchat/pages/user_info_page.dart';
import 'package:newfluchat/services/auth_service/firebase_atuh_service.dart';
import 'package:newfluchat/utils/app_loader.dart';
import 'package:newfluchat/utils/app_toast.dart';
import 'package:newfluchat/widgets/main_button.dart';
import 'package:newfluchat/widgets/textfeilds.dart';

import '../../utils/navigators.dart';

class SignUp extends StatefulWidget {
  static const String id = 'singUp';

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  void signUp()async{
    AuthService authService=AuthService();
    final password=passwordController.text.trim();
    final confirmPassword=confirmPassController.text.trim();
    final email=emailController.text.trim();
    if(password==confirmPassword){
      showLoader(context);
      authService.signUp(email, password).then((value){
        Go(context).close();
        if(value){
          showToast(context: context, message:"Ro'yxatdan muvafaqqiyatli o'tkazildi!");
          Go(context).id(UserInfoPage.id);
        }else{
          showToast(context: context, message: "Siz avval ro'yxatdan o'tgansiz!");
        }
      });
    }else{
      showToast(context: context, message: "Parolni to'g'ri kiriting!");
    }
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
                "Ro'yxatdan o'tish",
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
              TextFields(
                controller: confirmPassController,
                text: 'Passwordni tasdiqlang',
              ),
              const SizedBox(
                height: 40,
              ),
              MainButton(title: "Ro'yxatdan o'tish", onPressed: signUp),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                    text: 'Akkauntigiz bormi?',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(
                          text: 'Kirish',
                          style: const TextStyle(color: mainColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                          Navigator.pushNamed(context, 'signIn');
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
