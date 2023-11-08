class MessageModel {
  String id;
  String senderID;
  String sentTime;
  bool read;
  String image;
  String file;
  String message;

  MessageModel({
    required this.id,
    required this.senderID,
    required this.sentTime,
    required this.read,
    required this.image,
    required this.file,
    required this.message
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderID': senderID,
      'sentTime': sentTime,
      'read': read,
      'image': image,
      'file': file,
      'message': message,
    };
  }

  factory MessageModel.fromMap

      (Map<String, dynamic> map){
    return MessageModel(id: map['id'],
        senderID: map["senderID"],
        sentTime: map["sentTime"] as String,
        read: map["read"] as bool,
        image: map["image"] as String,
        file: map["file"] as String,
        message: map["message"] as String);
  }
}