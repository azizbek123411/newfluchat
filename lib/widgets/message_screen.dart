import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newfluchat/constants/main_color.dart';

class MessageScreen extends StatelessWidget {
  bool byMe;

  MessageScreen({super.key, required this.byMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(
        left: byMe ? 80 : 16,
        right: !byMe ? 80 : 16,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        color: byMe ? Colors.blue.shade200 : Colors.greenAccent,
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(15),
          topLeft: const Radius.circular(15),
          bottomLeft: byMe ? const Radius.circular(15) : Radius.zero,
          bottomRight: byMe ? Radius.zero : const Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'fasffaafasffaafasffaafasffaafasffaafasffaafasffaafasffaafasffaafasffa',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                '22:10',
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                byMe ? Icons.done_all : null,
                size: 20,
                color: Colors.blue.shade700,
              ),
            ],
          )
        ],
      ),
    );
  }
}
