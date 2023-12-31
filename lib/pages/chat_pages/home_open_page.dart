import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:newfluchat/constants/main_color.dart';
import 'package:newfluchat/models/chat_model.dart';
import 'package:newfluchat/models/message_model.dart';
import 'package:newfluchat/models/user_model.dart';
import 'package:newfluchat/widgets/message_screen.dart';

import '../../utils/app-id-generator.dart';

class OpenPage extends StatefulWidget {
  final UserModel? userModel;
  final ChatModel? chatModel;
  static const String id = 'open_page';

  const OpenPage({
    super.key,
    this.chatModel,
    this.userModel,
  });

  @override
  State<OpenPage> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  final messageController = TextEditingController();
  List<Message> allMessages = [];
  String myID = '1';

  void messageSend() {
    if (messageController.text.trim().isNotEmpty) {
      Message messageModel = Message(
          id: Token.id(),
          senderID: myID,
          sentTime: Token.now(),
          read: false,
          image: 'image',
          file: 'file',
          message: messageController.toString().trim());
      setState(() {
        allMessages.add(messageModel);
      });
    }
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.3),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.userModel?.name} ${widget.userModel?.surname}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
                Text(
                  widget.userModel!.online
                      ? 'Online'
                      : DateFormat("hh:mm")
                          .format(DateTime.parse(widget.userModel!.lastSeen)),
                  style: const TextStyle(color: Colors.white54, fontSize: 17),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: allMessages.length,
                itemBuilder: (context, index) {
                  return MessageScreen(
                    messageModel: allMessages[index],
                    myID: myID,
                  );
                }),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            width: double.infinity,
            height: 50,
            child: Center(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Enter message',
                  border: InputBorder.none,
                  hintStyle: const TextStyle(fontSize: 18),
                  suffixIcon: IconButton(
                    onPressed: messageSend,
                    icon: const Icon(
                      Icons.send,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
