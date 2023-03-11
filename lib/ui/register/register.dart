import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spitali_im/ui/login/login.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _personalNoController = TextEditingController();
  TextEditingController _telNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar("Regjistrohu", Icons.arrow_back_ios, context),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            primaryTextField("Emri", false, _nameController),
            SizedBox(
              height: 20.0,
            ),
            primaryTextField("Mbiemri", false, _surnameController),
            SizedBox(
              height: 20.0,
            ),
            primaryTextField("Nr. personal", false, _personalNoController),
            SizedBox(
              height: 20.0,
            ),
            primaryTextField("Nr. i telefonit", false, _telNoController),
            SizedBox(
              height: 20.0,
            ),
            primaryTextField("Email", false, _emailController),
            SizedBox(
              height: 20.0,
            ),
            primaryTextField("Fjalëkalimi", true, _passwordController),
            SizedBox(
              height: 20.0,
            ),
            mainButton(
              text: "Regjitrohu",
              onTap: () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _personalNoController.text,
                        password: _passwordController.text)
                    .then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Login(),
                        ),
                      ),
                    )
                    .onError((error, stackTrace) {
                  print("Error: Register");
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
