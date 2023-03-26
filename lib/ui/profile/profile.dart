import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:spitali_im/data/models/user_model.dart';
import 'package:spitali_im/ui/profile/complaint.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';
import 'package:spitali_im/utils/password_validation.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
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
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: mainBlueColor(),
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: mainBlueColor(),
            fontFamily: kRoboto,
          ),
        ),
      ),
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
                          onTap: () async {
                            bool passwordValid = passwordValidation(
                                _passwordController.text.toString());
                            if (passwordValid) {
                              profileHelper
                                  .changePassword(
                                    context,
                                    _passwordController.text.toString(),
                                  )
                                  .then(
                                    (value) => _passwordController.clear(),
                                  );
                            } else {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: "Provoni perseri",
                                text:
                                    "Fjalekalimi duhet te kete 8 karatere dhe te permbaj te pakten nje shkronje te madhe, nje numer dhe nje simbol.",
                                confirmBtnText: "Ne rregull",
                              );
                            }
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
