class UserModel {
  String id;
  String name;
  String surname;
  String nickname;
  // String photoUrl;
  bool online;
  String lastSeen;
  String bio;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.nickname,
    // required this.photoUrl,
    required this.online,
    required this.lastSeen,
    required this.bio
  });

  factory UserModel.fromJson( dynamic json)=>
      UserModel(name: json['name'],
          id:json['id'],
          surname: json['surname'],
          nickname: json["nickname"],
          // photoUrl: json["photoUrl"],
          online: json["online"],
          lastSeen: json["lastSeen"],
          bio: json["bio"]);
Map<String, dynamic>toJson()=>{
  'id':id,
  'name':name,
  'surname':surname,
  "nickname":nickname,
  // "photoUrl":photoUrl,
  "online":online,
  "lastSeen":lastSeen,
  "bio":bio,
};

}