import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spitali_im/ui/login/login.dart';
import 'package:spitali_im/ui/navigation/nav.dart';
import 'package:spitali_im/ui/splashscreen/splash_screen.dart';
import 'package:spitali_im/ui/home/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MyAppT());
}

class MyAppT extends StatelessWidget {
  const MyAppT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavigation(),
    );
  }
}
