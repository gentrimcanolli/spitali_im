import 'package:flutter/material.dart';
import 'package:spitali_im/constants/colors.dart';

import '../../constants/fonts.dart';

AppBar primaryAppBar(String title, bool hasAction) {
  return AppBar(
    toolbarHeight: 70.0,
    backgroundColor: Colors.white,
    actions: hasAction
        ? [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: mainBlueColor(),
                size: 30.0,
              ),
              onPressed: () {},
            ),
          ]
        : null,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: mainBlueColor(),
        fontFamily: kRoboto,
      ),
    ),
  );
}

AppBar secondaryAppBar(String title, IconData icon, BuildContext context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          icon,
          color: mainBlueColor(),
        ),
      ),
    ),
    toolbarHeight: 70.0,
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: mainBlueColor(),
        fontFamily: kRoboto,
      ),
    ),
  );
}

TextField primaryTextField(
    String labelText, bool isPassword, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      labelText: labelText,
    ),
  );
}

Container mainButton({required String text, required Function onTap}) {
  return Container(
    width: double.infinity,
    height: 50.0,
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: kRoboto,
          fontSize: 20.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: mainBlueColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}

Text primaryText(
    {required String text,
    required double fontSize,
    required Color fontColor,
    required bool isBold}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: kRoboto,
      fontSize: fontSize,
      color: fontColor,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    ),
  );
}

Card departmentCard({
  required String imagePath,
  required String text,
}) {
  return Card(
    shadowColor: shadowColor(),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 60.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 70.0,
            height: 70.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          primaryText(
              text: text,
              fontSize: 15.0,
              fontColor: mainBlueColor(),
              isBold: false),
        ],
      ),
    ),
  );
}
