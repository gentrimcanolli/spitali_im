import 'package:flutter/material.dart';
import 'package:spitali_im/constants/fonts.dart';
import 'package:spitali_im/ui/doctors/doctor_details.dart';

import '../../constants/colors.dart';
import '../reusable_widgets/reusable_widgets.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: primaryAppBar("Doktoret", false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => DoctorDetailsScreen(),
                    ),
                  );
                },
                child: doctorDetailsCard(
                    name: "Dr. Gentrim Canolli",
                    department: "Kardiologji",
                    details: ""),
              )
            ],
          ),
        ),
      ),
    );
  }
}
