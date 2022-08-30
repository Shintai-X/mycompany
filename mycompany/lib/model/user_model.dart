import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? lastname;
  String? number;

  UserModel({this.uid, this.email, this.firstname, this.lastname, this.number});

//receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      number: map['number'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstname,
      'secondname': lastname,
      'number': number,
    };
  }
}
