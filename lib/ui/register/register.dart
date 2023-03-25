import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:spitali_im/data/models/user_model.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

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
              primaryTextField("Emri", false, _nameController),
              const SizedBox(
                height: 20.0,
              ),
              primaryTextField("Mbiemri", false, _surnameController),
              const SizedBox(
                height: 20.0,
              ),
              primaryTextField("Nr. personal", false, _personalNoController),
              const SizedBox(
                height: 20.0,
              ),
              primaryTextField("Nr. i telefonit", false, _telNoController),
              const SizedBox(
                height: 20.0,
              ),
              primaryTextField("Email", false, _emailController),
              const SizedBox(
                height: 20.0,
              ),
              primaryTextField("Fjalëkalimi", true, _passwordController),
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
