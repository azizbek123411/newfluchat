import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:newfluchat/models/message_model.dart';

class MessageScreen extends StatelessWidget {
  final MessageModel messageModel;
  final String myID;

  const MessageScreen(
      {super.key, required this.myID, required this.messageModel});

  @override
  Widget build(BuildContext context) {
    final byMe = messageModel.senderID == myID;
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            messageModel.toString(),
            style: const TextStyle(
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
              Text(
                DateFormat('hh:mm').format(
                  DateTime.parse(messageModel.sentTime),
                ),
                style: const TextStyle(
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
