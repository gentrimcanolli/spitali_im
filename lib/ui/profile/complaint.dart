import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import '../reusable_widgets/reusable_widgets.dart';

class ComplaintScreen extends StatefulWidget {
  String name;
  String personalNo;
  String email;

  ComplaintScreen({
    required this.name,
    required this.personalNo,
    required this.email,
  });

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  TextEditingController controller = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar("Ankesë", context),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                profileTextView(
                  text: "Emri",
                  isPassword: false,
                  controller: controller,
                  isEnabled: false,
                  labelText: widget.name,
                ),
                profileTextView(
                  text: "Nr. personal",
                  isPassword: false,
                  controller: controller,
                  isEnabled: false,
                  labelText: widget.personalNo,
                ),
                profileTextView(
                  text: "Email",
                  isPassword: false,
                  controller: controller,
                  isEnabled: false,
                  labelText: widget.email,
                ),
                messageTextView(
                    messageBoxHeight: 200.0, controller: _messageController),
                primaryButton(
                  text: "Dërgo",
                  onTap: () async {
                    sendEmail(_messageController.text.toString());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future sendEmail(String body) async {
    try {
      await FlutterEmailSender.send(
        Email(
          subject: "Ankesa - Spital Im",
          recipients: ['gentrim14@gmail.com'],
          body: body,
          isHTML: false,
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
