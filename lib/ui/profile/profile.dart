import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:spitali_im/data/models/user_model.dart';
import 'package:spitali_im/ui/profile/complaint.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

import '../../data/database/profile_helper.dart';

class ProfileScreen extends StatefulWidget {
  String personalNo = '';

  ProfileScreen({
    required this.personalNo,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _personalNoController = TextEditingController();
  ProfileHelper profileHelper = ProfileHelper();
  late UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar("Profili", true, context),
      body: Center(
        child: FutureBuilder(
            future: profileHelper.getUserProfile(widget.personalNo),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                userModel = snapshot.data!;

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        profileTextView(
                          text: "Emri",
                          isPassword: false,
                          controller: _controller,
                          isEnabled: false,
                          labelText: "${userModel.name} ${userModel.surname}",
                        ),
                        profileTextView(
                          text: "Nr. personal",
                          isPassword: false,
                          controller: _personalNoController,
                          isEnabled: false,
                          labelText: userModel.personalNo,
                        ),
                        profileTextView(
                          text: "Email",
                          isPassword: false,
                          controller: _controller,
                          isEnabled: false,
                          labelText: userModel.email,
                        ),
                        profileTextView(
                          text: "Fjalëkalimi",
                          isPassword: true,
                          controller: _passwordController,
                          isEnabled: true,
                        ),
                        primaryButton(
                          text: "Përditëso profilin",
                          onTap: () {
                            QuickAlert.show(
                                context: context,
                                title: "Përditëso profilin",
                                text: "A dëshironi të përditësoni profilin?",
                                type: QuickAlertType.confirm,
                                confirmBtnText: "Po",
                                cancelBtnText: "Jo",
                                onConfirmBtnTap: () async {

                                });
                          },
                        ),
                        const SizedBox(height: 20.0),
                        secondaryButton(
                            text: "Ankesë",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => ComplaintScreen(
                                    name: userModel.name,
                                    personalNo: userModel.personalNo,
                                    email: userModel.email,
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
