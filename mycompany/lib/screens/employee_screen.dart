import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mycompany/controllers/employee_controller.dart';
import 'package:mycompany/screens/employee_gestion.dart';

class EmployeeScreen extends StatelessWidget {
  EmployeeScreen({super.key});

  EmployeeController controller2 = Get.put(EmployeeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: EmployeeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Employé"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        )),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ignore: prefer_const_constructors
                          Row(
                            children: [
                              Text(
                                "Ajouter",
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
                                  Get.to(EmpRegistreScreen());
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: controller2.emplist.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Row(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                              "${controller2.emplist[index].firstname} ${controller2.emplist[index].lastname} \n ${controller2.emplist[index].poste} ",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.visible,
                                              textAlign: TextAlign.start),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
