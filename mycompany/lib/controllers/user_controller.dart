import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mycompany/model/user_model.dart';

class UserController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  String name = '';
  @override
  void onInit() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      //print('this is the logged in user ${this.loggedInUser.firstname}');
      name = this.loggedInUser.firstname!;
      update();
    });
    super.onInit();
    ever(name as RxString, (value) {
      onInit();
    });
  }

  @override
  void dispose() {
    Get.delete<UserController>();
    super.dispose();
  }
}
