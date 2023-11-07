import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newfluchat/constants/main_color.dart';
import 'package:newfluchat/widgets/message_screen.dart';

class OpenPage extends StatefulWidget {
  static const String id = 'open_page';

  const OpenPage({
    super.key,
  });

  @override
  State<OpenPage> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  TextEditingController messageController = TextEditingController();
  void messageSend(){}

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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abdulhafiz Yusupov',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(color: Colors.white54, fontSize: 17),
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
                itemCount: 33,
                itemBuilder: (context, index) {
                  return MessageScreen(
                    byMe: index % 2 == 0,
                  );
                }),
          ),
          Container(
            decoration:const BoxDecoration(
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: mainColor,
                        ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
