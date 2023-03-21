import 'package:flutter/material.dart';
import 'package:spitali_im/data/models/doctor_model.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';
import 'package:spitali_im/ui/doctors/doctor_details.dart';
import '../../data/database/department_helper.dart';

class DepartmentDoctorsScreen extends StatefulWidget {
  String departmentId;
  DepartmentDoctorsScreen({this.departmentId = ''});

  @override
  State<DepartmentDoctorsScreen> createState() =>
      _DepartmentDoctorsScreenState();
}

class _DepartmentDoctorsScreenState extends State<DepartmentDoctorsScreen> {
  DepartmentHelper departmentHelper = DepartmentHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar("Doktorët", context),
      body: FutureBuilder(
        future: departmentHelper.getDepartmentDoctorList(widget.departmentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<DoctorModel> doctorList = snapshot.data!;
            return ListView.builder(
              itemCount: doctorList.length,
              itemBuilder: (context, int index) {
                DoctorModel doctorsModel = doctorList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => DoctorDetailsScreen(
                                name: doctorsModel.name,
                                department: doctorsModel.department,
                                description: doctorsModel.description,
                              ),
                            ),
                          );
                        },
                        child: doctorDetailsCard(
                          name: doctorsModel.name,
                          department: doctorsModel.department,
                          details: "",
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
