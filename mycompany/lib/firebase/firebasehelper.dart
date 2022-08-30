import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class firebasehelper {
  final auth = FirebaseAuth.instance;
  Future<User?> handleSignIn(String mail, String mdp) async {
    final User? user =
        (await auth.signInWithEmailAndPassword(email: mail, password: mdp))
            .user;
    return user;
  }

  Future<User?> create(
      String mail, String mdp, String nom, String prenom, String numero) async {
    final create =
        await auth.signInWithEmailAndPassword(email: mail, password: mdp);
    final User? user = create.user;
    String? uid = user?.uid;
    Map<String, String> map = {
      "firstname": nom,
      "lastname": prenom,
      "number": numero,
    };
    addUser(uid!, map);
    return user;
  }
}

final entryPoint = FirebaseDatabase.instance.ref();
final entry_user = entryPoint.child("users");

addUser(String uid, Map map) {
  entryPoint.child(uid).set(map);
}
