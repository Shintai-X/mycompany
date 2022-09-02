// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mycompany/controllers/user_controller.dart';
import 'package:mycompany/model/user_model.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class ProfilScreen extends StatelessWidget {
  ProfilScreen({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  var ispwdhidden = true.obs;
  final firstnameEC = TextEditingController();
  final lastnameEC = TextEditingController();
  final numberEC = TextEditingController();
  final mailEC = TextEditingController();
  final adresseEC = TextEditingController();
  final dateEC = TextEditingController();
  UserController controller = Get.put(UserController());
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    double width_var = MediaQuery.of(context).size.width;
    double height_var = MediaQuery.of(context).size.height;
    return GetBuilder<UserController>(
        init: UserController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text("Profil"),
                automaticallyImplyLeading: true,
              ),
              body: Container(
                child: Form(
                  key: _formkey,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Modifer votre profil",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            height: height_var * 0.01,
                          ),
                          Stack(
                            children: <Widget>[
                              SizedBox(
                                height: height_var * 0.03,
                              ),
                              Container(
                                width: width_var * 0.34,
                                height: height_var * 0.18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/noir.jpg"),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: height_var * 0.03,
                                  width: width_var * 0.03,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: width_var * 0.025,
                                    ),
                                    color: Colors.blue,
                                  ),
                                  child: Icon(Icons.camera_alt_outlined,
                                      color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height_var * 0.03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width_var * 0.46,
                                child: TextFormField(
                                  validator: (value) {
                                    RegExp regex = new RegExp(r'[A-Za-z]');
                                    if (value!.isEmpty) {
                                      return ("Veuillez saisir un Nom");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Veuillez saisir un Nom  valide");
                                    }
                                  },
                                  controller: lastnameEC,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1)),
                                    hintText: "${controller.lname}",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width_var * 0.46,
                                child: TextFormField(
                                  validator: (value) {
                                    RegExp regex = new RegExp(r'[A-Za-z]');
                                    if (value!.isEmpty) {
                                      return ("Veuillez saisir un Prenom");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Veuillez saisir un Prenom valide");
                                    }
                                  },
                                  controller: firstnameEC,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1)),
                                    hintText: "${controller.name}",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height_var * 0.01,
                          ),
                          TextFormField(
                            validator: (value) {
                              RegExp regex = new RegExp(
                                  r'^(0[1-9]|1[0-9]|2[0-9]|3[01])-/.-/.$');
                              if (value!.isEmpty) {
                                return ("Veuillez saisir une Date de naissance");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Veuillez saisir une date de naissance valide(dd/mm/yy)");
                              }
                            },
                            controller: dateEC,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.calendar_month),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 1)),
                              hintText: "Date de Naissance*",
                            ),
                          ),
                          SizedBox(
                            height: height_var * 0.01,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Veuillez saisir votre email!");
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Veuillez saisir un email valide!");
                              }
                              return null;
                            },
                            controller: mailEC,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 1)),
                              hintText: "${controller.email}",
                            ),
                          ),
                          SizedBox(
                            height: height_var * 0.01,
                          ),
                          TextFormField(
                            validator: (value) {
                              RegExp regex = new RegExp(r'^[0-9]{10}$');
                              if (value!.isEmpty) {
                                return ("Veuillez saisir un numero de telephone");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Veuillez saisir un numero de telephone valide(10 didgts)");
                              }
                            },
                            controller: numberEC,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 1)),
                              hintText: "${controller.number}",
                            ),
                          ),
                          SizedBox(
                            height: height_var * 0.01,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Veuillez saisir une adresse");
                              }
                            },
                            controller: adresseEC,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.home),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 1)),
                              hintText: "Adresse*",
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                          SizedBox(
                            height: height_var * 0.07,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.lightBlue,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width_var * 0.30,
                                    vertical: height_var * 0.01),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            child: Text("Enregistrer"),
                          ),
                          SizedBox(
                            height: height_var * 0.01,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(HomeScreen());
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width_var * 0.34,
                                    vertical: height_var * 0.01),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            child: Text("Annuler"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
