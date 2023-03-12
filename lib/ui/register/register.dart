import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spitali_im/ui/login/login.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _personalNoController = TextEditingController();
  TextEditingController _telNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: secondaryAppBar("Regjistrohu", context),
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
            primaryButton(
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
                          builder: (ctx) => LoginScreen(),
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
