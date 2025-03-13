import 'dart:convert';

import 'package:flutter/cupertino.dart';

class User{
  final int userId;

  const User(
  {
  required this.userId});

  factory User.fromJson(Map<String,dynamic>json) => User(userId: json['userId']);

  Map<String,dynamic> toJson() => {
    "userId" : userId
  };
}
