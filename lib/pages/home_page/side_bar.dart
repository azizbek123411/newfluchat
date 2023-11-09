import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newfluchat/constants/main_color.dart';
import 'package:newfluchat/services/rtdb_service/rtdb_service.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder(
        future: RealDbService().get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return const SizedBox();
          } else {
            final user = snapshot.hasData;
            log(user.toString());
            return ListView(
              children: [
                DrawerHeader(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: mainColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'drawer',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.heart_broken_sharp),
                  title: const Text('Brokent heart'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
