import 'package:flutter/material.dart';
import 'package:spitali_im/constants/colors.dart';
import 'package:spitali_im/data/models/department_model.dart';
import 'package:spitali_im/ui/home/department_doctors.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';
import '../../data/database/department_helper.dart';

class DepartmentDetailsScreen extends StatefulWidget {
  String departmentId = '';
  String imagePath;

  DepartmentDetailsScreen(
      {required this.departmentId, required this.imagePath});

  @override
  State<DepartmentDetailsScreen> createState() =>
      _DepartmentDetailsScreenState();
}

class _DepartmentDetailsScreenState extends State<DepartmentDetailsScreen> {
  // DBHelper dbHelper = DBHelper();
  late DepartmentModel departmentsModel;
  DepartmentHelper departmentHelper = DepartmentHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar("Departamentet", context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                widget.imagePath,
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 20.0,
              ),
              FutureBuilder(
                future:
                    departmentHelper.getDepartmentDetails(widget.departmentId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    departmentsModel = snapshot.data!;
                    return SizedBox(
                      height: 400.0,
                      child: Card(
                        shadowColor: shadowColor(),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            top: 30.0,
                            right: 30.0,
                            bottom: 10.0,
                          ),
                          child: Column(
                            children: [
                              primaryText(
                                  text: departmentsModel.title,
                                  fontSize: 23.0,
                                  fontColor: mainBlueColor(),
                                  isBold: true),
                              const SizedBox(
                                height: 20.0,
                              ),
                              primaryText(
                                  text: departmentsModel.description,
                                  fontSize: 22.0,
                                  fontColor: textColor(),
                                  isBold: false),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              primaryButton(
                  text: "Doktorët",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => DepartmentDoctorsScreen(
                          departmentId: departmentsModel.title,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
