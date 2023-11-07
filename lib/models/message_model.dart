class MessageModel{
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
}