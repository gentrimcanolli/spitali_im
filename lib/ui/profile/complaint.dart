import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widgets.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: secondaryAppBar("Ankesë", context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              profileTextView(
                  text: "Emri", isPassword: false, controller: controller),
              profileTextView(
                  text: "Nr. personal",
                  isPassword: false,
                  controller: controller),
              profileTextView(
                  text: "Email", isPassword: false, controller: controller),
              messageTextView(messageBoxHeight: 200.0, controller: controller),
              primaryButton(text: "Dërgo", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
