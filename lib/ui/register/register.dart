import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:spitali_im/data/models/user_model.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';
import 'package:spitali_im/utils/email_validation.dart';
import 'package:spitali_im/utils/password_validation.dart';
import 'package:spitali_im/utils/phone_no_validation.dart';

import '../../data/database/register_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterHelper registerHelper = RegisterHelper();
  late UserModel userModel;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _personalNoController = TextEditingController();
  final TextEditingController _telNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar("Regjistrohu", context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              primaryTextField(
                  "Emri", false, _nameController, TextInputType.name, 16),
              const SizedBox(
                height: 20.0,
              ),
              primaryTextField(
                  "Mbiemri", false, _surnameController, TextInputType.name, 16),
              const SizedBox(
                height: 20.0,
              ),
              primaryTextField("Nr. personal", false, _personalNoController,
                  TextInputType.number, 10),
              const SizedBox(
                height: 20.0,
              ),
              primaryTextField("Nr. i telefonit", false, _telNoController,
                  TextInputType.phone, 12),
              const SizedBox(
                height: 20.0,
              ),
              primaryTextField("Email", false, _emailController,
                  TextInputType.emailAddress, 100),
              const SizedBox(
                height: 20.0,
              ),
              primaryTextField("Fjalëkalimi", true, _passwordController,
                  TextInputType.text, 100),
              const SizedBox(
                height: 20.0,
              ),
              primaryButton(
                  text: "Regjistrohu",
                  onTap: () async {
                    setState(() {
                      userModel = UserModel(
                        name: _nameController.text.toString(),
                        surname: _surnameController.text.toString(),
                        personalNo: _personalNoController.text.toString(),
                        telephoneNo: _telNoController.text.toString(),
                        email: _emailController.text.toString(),
                      );
                    });

                    if (validInfo()) {
                      await registerHelper
                          .registerUser(context, userModel,
                              _passwordController.text.toString())
                          .then((value) {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: "Sukses!",
                            text: "Jeni regjistruar me sukses",
                            onConfirmBtnTap: () {
                              Navigator.pop(context);
                            }).then(
                          (value) => Navigator.pop(context),
                        );
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  bool validInfo() {
    bool passwordValid =
        passwordValidation(_passwordController.text.toString());

    bool emailValid = emailValidation(_emailController.text.toString());

    bool phoneValid = phoneNoValidation(_telNoController.text.toString());

    if (userModel.personalNo.isEmpty ||
        userModel.telephoneNo.isEmpty ||
        userModel.email.isEmpty ||
        userModel.name.isEmpty ||
        userModel.surname.isEmpty) {
      showErrorAlert("Plotesoni te gjitha fushat!");
      return false;
    } else if (_personalNoController.text.length < 9) {
      showErrorAlert("Numri personal duhet t'i kete 9 karatere");
      return false;
    } else if (!phoneValid) {
      showErrorAlert("Numri i telefonit duhet te kete formatin +383123123");
      return false;
    } else if (!emailValid) {
      showErrorAlert("Email duhet te kete formatin text@gmail.com");
      return false;
    } else if (!passwordValid) {
      showErrorAlert(
          "Fjalekalimi duhet te kete 8 karatere dhe te permbaj te pakten nje shkronje te madhe, nje numer dhe nje simbol.");
      return false;
    } else {
      return true;
    }
  }

  void showErrorAlert(String text) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: "Error!",
        text: text,
        confirmBtnText: "Ne rregull",
        onConfirmBtnTap: () {
          Navigator.pop(context);
        });
  }
}
