import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? lastname;
  String? number;
  String? adresse;
  String? date;

  UserModel({
    this.uid,
    this.email,
    this.firstname,
    this.lastname,
    this.number,
    this.adresse = '',
    this.date = '',
  });

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
      'lastname': lastname,
      'number': number,
      'adresse': adresse,
      'date': date,
    };
  }

  void pr() {
    print('${this.uid}+${this.email}+${this.lastname}+${this.number}');
  }
}
