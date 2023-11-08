import 'dart:developer';

import 'package:newfluchat/models/message_model.dart';
import 'package:newfluchat/models/user_model.dart';

class ChatModel {
  UserModel user1;
  UserModel user2;
  String id;
  String chatCreatedTime;
  List<MessageModel> messages;

  ChatModel({
    required this.id,
    required this.chatCreatedTime,
    required this.messages,
    required this.user1,
    required this.user2,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    List <MessageModel>messageAll=[];
final list=json['message'];
for(final item in list){
 try {
        messageAll.add(MessageModel.fromMap(item));
      }catch(error){
   log('Error in parsing message:',error: error);
 }
    }
    return ChatModel(
      id: json['id'],
      chatCreatedTime: json["chatCreatedTime"],
      messages: messageAll,
      user1: UserModel.fromJson(json['user1']),
      user2: UserModel.fromJson(json['user2']),
    );
  }


}
