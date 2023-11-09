class Message {
  String id;
  String senderID;
  String sentTime;
  bool read;
  String image;
  String file;
  String message;

  Message({
    required this.id,
    required this.senderID,
    required this.message,
    required this.file,
    required this.image,
    required this.read,
    required this.sentTime,
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

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as String,
      senderID: map['senderID'] as String,
      sentTime: map['sentTime'] as String,
      read: map['read'] as bool,
      image: map['image'] as String,
      file: map['file'] as String,
      message: map['message'] as String,
    );
  }
}
