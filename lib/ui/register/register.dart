import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:spitali_im/data/database/db_helper.dart';
import 'package:spitali_im/data/models/user_model.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DBHelper dbHelper = DBHelper();

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
      body: Padding(
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
                bool result = await dbHelper.userExists(
                    _personalNoController.text.toString(),
                    _emailController.text.toString());

                if (!result) {
                  UserModel userModel = UserModel(
                    name: _nameController.text.toString(),
                    surname: _surnameController.text.toString(),
                    personalNo: _personalNoController.text.toString(),
                    telephoneNo: _telNoController.text.toString(),
                    email: _emailController.text.toString(),
                    password: _passwordController.text.toString(),
                  );

                  dbHelper.registerUser(userModel);

                  showAlert(
                    context: context,
                    type: QuickAlertType.success,
                    message: "You have successfully registered",
                    confirmType: false,
                  );
                } else if (_nameController.text.toString().isEmpty ||
                    _surnameController.text.toString().isEmpty ||
                    _personalNoController.text.toString().isEmpty ||
                    _telNoController.text.toString().isEmpty ||
                    _emailController.text.toString().isEmpty ||
                    _passwordController.text.toString().isEmpty) {
                  showAlert(
                      context: context,
                      type: QuickAlertType.error,
                      message: "All field are required!",
                      confirmType: false);
                } else {
                  showAlert(
                      context: context,
                      type: QuickAlertType.error,
                      message: "User already exists",
                      confirmType: false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
