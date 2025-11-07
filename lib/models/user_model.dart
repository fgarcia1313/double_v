class UserModel {
  final String create;
  final String email;
  final String name;
  final String surName;
  final String born;
  final String uid;

  UserModel({
    required this.create,
    required this.email,
    required this.name,
    required this.surName,
    required this.born,
    required this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      create: json['create'],
      email: json['email'],
      name: json['name'],
      surName: json['surName'],
      born: json['born'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'create': create,
      'email': email,
      'name': name,
      'surName': surName,
      'born': born,
      'uid': uid,
    };
  }
}