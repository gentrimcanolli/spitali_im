import 'package:flutter/material.dart';
import 'package:spitali_im/ui/doctors/doctor_details.dart';
import '../../data/models/db_helper.dart';

import '../../data/models/doctors_model.dart';
import '../reusable_widgets/reusable_widgets.dart';

class DoctorsScreen extends StatefulWidget {
  String departmentId;

  DoctorsScreen({this.departmentId = ''});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar("Doktorët", false),
      body: FutureBuilder(
        future: DBHelper.getDoctorList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<DoctorsModel> doctorList = snapshot.data!;
            return ListView.builder(
              itemCount: doctorList.length,
              itemBuilder: (context, int index) {
                DoctorsModel doctorsModel = doctorList[index];
                return Center(
                  child: Padding(
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
                              details: ""),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
