import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spitali_im/constants/colors.dart';

import '../../constants/fonts.dart';

AppBar primaryAppBar(
  String title,
) {
  return AppBar(
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

AppBar secondaryAppBar(String title, BuildContext context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
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
    String labelText,
    bool isPassword,
    TextEditingController controller,
    TextInputType keyboardType,
    int maxLength) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    keyboardType: keyboardType,
    maxLength: maxLength,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      counterText: "",
      labelText: labelText,
    ),
  );
}

Container primaryButton({required String text, required Function onTap}) {
  return Container(
    width: double.infinity,
    height: 50.0,
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: mainBlueColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: kRoboto,
          fontWeight: FontWeight.w400,
          fontSize: 20.0,
        ),
      ),
    ),
  );
}

Container secondaryButton({required String text, required Function onTap}) {
  return Container(
    width: double.infinity,
    height: 50.0,
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: mainBlueColor(),
          fontFamily: kRoboto,
          fontWeight: FontWeight.w400,
          fontSize: 20.0,
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
          const SizedBox(
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

Column profileTextView({
  required String text,
  required bool isPassword,
  required TextEditingController controller,
  required bool isEnabled,
  String labelText = '',
  String textController = '',
}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: primaryText(
              text: text,
              fontSize: 20.0,
              fontColor: mainBlueColor(),
              isBold: false),
        ),
      ),
      const SizedBox(height: 5),
      Material(
        elevation: 5,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        child: TextField(
          enabled: (isEnabled) ? true : false,
          obscureText: isPassword ? true : false,
          controller: controller,
          decoration: InputDecoration(
            hintText: labelText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20.0,
      )
    ],
  );
}

Column messageTextView(
    {required double messageBoxHeight,
    required TextEditingController controller}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: primaryText(
              text: "Mesazhi",
              fontSize: 20.0,
              fontColor: mainBlueColor(),
              isBold: false),
        ),
      ),
      const SizedBox(height: 5),
      Material(
        elevation: 5,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        child: SizedBox(
          height: messageBoxHeight,
          child: TextField(
            maxLines: null,
            expands: true,
            controller: controller,
            decoration: InputDecoration(
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20.0,
      )
    ],
  );
}

Card doctorDetailsCard(
    {required String name,
    required String department,
    required String details}) {
  return Card(
    shadowColor: shadowColor(),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "images/doctor_profile.jpg",
                width: 100,
                height: 100,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  primaryText(
                    text: name,
                    fontSize: 20.0,
                    fontColor: mainBlueColor(),
                    isBold: false,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 25.0,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: mainBlueColor(),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        department,
                        style: TextStyle(
                          fontFamily: kRoboto,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          showDescription(details),
        ],
      ),
    ),
  );
}

Row workingTime({required String weekDayName, String time = "09:00 - 22:00"}) {
  return Row(
    children: [
      Image.asset(
        "images/clock_icon.png",
        width: 50,
        height: 50,
      ),
      const SizedBox(
        width: 10.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          primaryText(
              text: weekDayName,
              fontSize: 15.0,
              fontColor: mainBlueColor(),
              isBold: false),
          primaryText(
              text: time,
              fontSize: 13.0,
              fontColor: mainGrayColor(),
              isBold: false),
        ],
      ),
    ],
  );
}

showDescription(String details) {
  if (details != '') {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        primaryText(
            text: details,
            fontSize: 18.0,
            fontColor: textColor(),
            isBold: false),
      ],
    );
  } else {
    return const SizedBox();
  }
}
