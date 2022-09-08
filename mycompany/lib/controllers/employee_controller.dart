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
  String img = '';
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
        em.uid = emp['uid'];
        em.firstname = emp['firstname'];
        em.lastname = emp['lastname'];
        em.poste = emp['poste'];
        em.img = emp['img'];
        em.email = emp['email'];
        em.number = emp['number'];
        emplist.add(em);
        update();
        refresh();
      }
    } catch (e) {
      Get.snackbar('error', '${e.toString()}');
    }
  }

  Future<EmployeeModel> GetEmp(String Euid) async {
    EmployeeModel emp = EmployeeModel();
    var emp2 = await FirebaseFirestore.instance
        .collection('employees')
        .doc(Euid)
        .get()
        .obs;
    emp = emp2 as EmployeeModel;
    update();

    return emp;
  }
}
