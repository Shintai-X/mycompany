import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:mycompany/model/employee_model.dart';

class DepartementModel {
  String? nom;
  String? img;
  late List<EmployeeModel> emps;
}
