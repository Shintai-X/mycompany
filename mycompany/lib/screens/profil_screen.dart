import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mycompany/model/user_model.dart';
import 'package:mycompany/screens/login_screen.dart';

class ProfilScreen extends StatelessWidget {
  ProfilScreen({Key? key}) : super(key: key);

  @override
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
