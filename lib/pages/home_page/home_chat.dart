import 'package:flutter/material.dart';
import 'package:newfluchat/pages/chat_pages/home_open_page.dart';
import 'package:newfluchat/utils/navigators.dart';

import '../../constants/main_color.dart';

class HomeChat extends StatelessWidget {
  const HomeChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        ListTile(
          onTap: (){
            Go(context).id(OpenPage.id);
          },
          leading: Container(
            height: 80,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: mainColor, width: 2)),
          ),
          title: const Text(
            'Abdulhafiz Yusupov',
            maxLines: 1,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          subtitle: const Text(
            "Qachon ko'rishamiz?",
            maxLines:1,
            style: TextStyle(color: Colors.grey),
          ),
          trailing: const Column(
            children: [
              Text(
                '13:31',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
