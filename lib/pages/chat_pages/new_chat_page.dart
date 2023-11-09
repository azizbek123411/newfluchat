import 'package:flutter/material.dart';
import 'package:newfluchat/constants/main_color.dart';
import 'package:newfluchat/pages/chat_pages/home_open_page.dart';
import 'package:newfluchat/services/rtdb_service/rtdb_service.dart';
import 'package:newfluchat/utils/app_loader.dart';
import 'package:newfluchat/utils/navigators.dart';
import 'package:newfluchat/widgets/main_button.dart';
import 'package:newfluchat/widgets/textfeilds.dart';

class NewChatPage extends StatelessWidget {
  static const String id = 'newchat';

  const NewChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController newController = TextEditingController();
    void newChat() async {
      showLoader(context);
      RealDbService realDbService = RealDbService();
      final user = await realDbService.getUser(newController.text.trim());
      if (user != null) {
        Navigator.pop(context);
        Navigator.pop(context);
        Go(context).go(
          OpenPage(userModel: user),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'New chat',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFields(controller: newController, text: "Enter username"),
              const SizedBox(
                height: 55,
              ),
              MainButton(
                title: "Boshlash",
                onPressed: newChat,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
