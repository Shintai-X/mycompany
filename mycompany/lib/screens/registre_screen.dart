// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mycompany/model/user_model.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class RegistreScreen extends StatefulWidget {
  const RegistreScreen({Key? key}) : super(key: key);

  @override
  State<RegistreScreen> createState() => _RegistreScreenState();
}

class _RegistreScreenState extends State<RegistreScreen> {
  final _formkey = GlobalKey<FormState>();
  bool _obscuretext = true;
  final firstnameEC = TextEditingController();
  final lastnameEC = TextEditingController();
  final numberEC = TextEditingController();
  final mailEC = TextEditingController();
  final password1EC = TextEditingController();
  final password2EC = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/BtW.jpg'), fit: BoxFit.cover)),
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "MY COMPANY SIGN UP",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Crée votre Compte",
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 175,
                            child: TextFormField(
                              controller: lastnameEC,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1)),
                                hintText: "Nom*",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 175,
                            child: TextFormField(
                              controller: firstnameEC,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1)),
                                hintText: "Prenom*",
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: numberEC,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1)),
                          hintText: "Numéro de Téléphone*",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: mailEC,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1)),
                          hintText: "Adresse e-mail*",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: password1EC,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscuretext = !_obscuretext;
                                });
                              },
                              child: Icon(_obscuretext
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.lightBlue, width: 1)),
                          hintText: "Mot de passe*",
                        ),
                        obscureText: _obscuretext,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: password2EC,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscuretext = !_obscuretext;
                                });
                              },
                              child: Icon(_obscuretext
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.lightBlue, width: 1)),
                          hintText: "Comfirmer votre Mot de passe*",
                        ),
                        obscureText: _obscuretext,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _signup(mailEC.text, password1EC.text);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 5),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        child: Text("S'inscrire!'"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Text(
                            "Vous avez déja un compte ?",
                            style: TextStyle(),
                            textAlign: TextAlign.end,
                          ),
                          InkWell(
                            onTap: (() {
                              Get.to(LoginScreen());
                            }),
                            child: Text(
                              "Connectez-vous ?",
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future _signup(String email, String password) async {
  //   try {
  //     await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) async => {
  //               () async {
  //                 // calling our firestore
  //                 // calling our user model
  //                 // sedning these values

  //                 FirebaseFirestore firebaseFirestore =
  //                     FirebaseFirestore.instance;
  //                 User? user = _auth.currentUser;

  //                 UserModel userModel = UserModel();

  //                 // writing all the values
  //                 userModel.email = user!.email;
  //                 userModel.uid = user.uid;
  //                 userModel.firstname = firstnameEC.text;
  //                 userModel.lastname = lastnameEC.text;
  //                 userModel.number = numberEC.text;

  //                 await firebaseFirestore
  //                     .collection("users")
  //                     .doc(user.uid)
  //                     .set(userModel.toMap());
  //                 Fluttertoast.showToast(
  //                     msg: "Account created successfully :) ");

  //                 Navigator.pushAndRemoveUntil(
  //                     (context),
  //                     MaterialPageRoute(builder: (context) => HomeScreen()),
  //                     (route) => false);
  //               }()
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   } on FirebaseAuthException catch (error) {
  //     switch (error.code) {
  //       case "invalid-email":
  //         errorMessage = "Your email address appears to be malformed.";
  //         break;
  //       case "wrong-password":
  //         errorMessage = "Your password is wrong.";
  //         break;
  //       case "user-not-found":
  //         errorMessage = "User with this email doesn't exist.";
  //         break;
  //       case "user-disabled":
  //         errorMessage = "User with this email has been disabled.";
  //         break;
  //       case "too-many-requests":
  //         errorMessage = "Too many requests";
  //         break;
  //       case "operation-not-allowed":
  //         errorMessage = "Signing in with Email and Password is not enabled.";
  //         break;
  //       default:
  //         errorMessage = "An undefined Error happened.";
  //     }
  //     Fluttertoast.showToast(msg: errorMessage!);
  //     print(error.code);
  //   }
  // }
  Future _signup(String email, String password) async {
    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      //User? user = _auth.currentUser;

      UserModel userModel = UserModel();

      // writing all the values
      print("this is the user information ${user} //// ");
      userModel.email = user!.email;
      userModel.uid = user.uid;
      userModel.firstname = firstnameEC.text;
      userModel.lastname = lastnameEC.text;
      userModel.number = numberEC.text;
      print("this is the user map ${userModel.toMap()} //// ");
      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(userModel.toMap());
      Fluttertoast.showToast(msg: "Account created successfully :) ");

      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        //some cases
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }
}
