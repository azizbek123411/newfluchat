import 'package:flutter/material.dart';
import 'package:newfluchat/constants/main_color.dart';
import 'package:newfluchat/pages/home_page/side_bar.dart';

import 'home_chat.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
          backgroundColor: mainColor,
          title: const Text(
            'FluChat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: const Sidebar(),
        body: ListView.builder(itemBuilder: (context, index) {
          return const HomeChat();
        }));
  }
}
