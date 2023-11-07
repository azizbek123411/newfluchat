import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newfluchat/pages/authentication/sign_in.dart';
import 'package:newfluchat/pages/authentication/sing_up.dart';
import 'package:newfluchat/pages/chat_pages/home_open_page.dart';
import 'package:newfluchat/pages/home_page/home_page.dart';
import 'package:newfluchat/pages/user_info_page.dart';
import 'package:newfluchat/services/auth_service/firebase_atuh_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const CheckUser(),
      routes: {
        HomePage.id:(context)=>const HomePage(),
        SignUp.id:(context)=>const SignUp(),
        SignIn.id:(context)=>const SignIn(),
        UserInfoPage.id:(context)=>const UserInfoPage(),
        OpenPage.id:(context)=> const OpenPage(),
    },
    );
  }
}
class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: AuthService().getCurrentUser(), builder:(context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }else if(snapshot.hasError){
        return const Center(
          child: Icon(
            Icons.error,
            size: 30,
              color: Colors.red,
          ),
        );
      }else{
        if(snapshot.data==null){
          return const SignUp();
        }else{
          return const HomePage();
        }
      }
    });
  }
}



