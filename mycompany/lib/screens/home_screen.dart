import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mycompany/model/user_model.dart';
import 'package:mycompany/screens/login_screen.dart';
import 'package:mycompany/screens/profil_screen.dart';

import '../controllers/user_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  //final ccontroller = Get.find<UserController>();
  UserController controller = Get.put(UserController());
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var height_var = MediaQuery.of(context).size.height;
    var width_var = MediaQuery.of(context).size.width;
    return GetBuilder<UserController>(
        init: UserController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.blue,
            appBar: AppBar(
              elevation: 0,
              title: Text("Bonjour ${controller.name}"),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    _signOut();
                    Get.to(LoginScreen());
                  },
                ),
              ],
            ),
            body: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      "Agence",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    Spacer(),
                    InkWell(
                      child: Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: 30,
                      ),
                      onTap: () {
                        //  Get.to();
                      },
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: ClipRRect(
              child: BottomAppBar(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width_var * 0.12,
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.home),
                      label: Text(
                        'Acceuil',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Get.to(HomeScreen());
                      },
                    ),
                    SizedBox(
                      width: width_var * 0.15,
                      height: height_var * 0.09,
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.person),
                      label: Text(
                        'Profil',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Get.to(ProfilScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    controller.dispose();
  }
}
