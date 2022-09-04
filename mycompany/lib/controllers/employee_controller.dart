import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mycompany/model/employee_model.dart';

class EmployeeController extends GetxController {
  var emplist = <EmployeeModel>[];
  String? uid;
  String? firstname;
  String? lastname;
  String? email;
  String? img;
  String? poste;
  String? number;

  @override
  void onInit() async {
    try {
      QuerySnapshot emps = await FirebaseFirestore.instance
          .collection('employees')
          .orderBy('firstname')
          .get();
      for (var emp in emps.docs) {
        EmployeeModel em = EmployeeModel();
        em.firstname = emp['firstname'];
        em.lastname = emp['lastname'];
        em.poste = emp['poste'];
        emplist.add(em);

        update();
      }
    } catch (e) {
      Get.snackbar('error', '${e.toString()}');
    }
  }
}
