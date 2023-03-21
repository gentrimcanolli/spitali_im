import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spitali_im/ui/login/login.dart';
import 'package:spitali_im/ui/navigation/nav.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';
import 'package:spitali_im/ui/splashscreen/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final fsInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
        // body: LoginScreen(),
        // body: MainNavigation(
        //   personalNo: "a",
        // ),
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       addUser();
        //     },
        //     child: Text("Add"),
        //   ),
        // ),
      ),
    );
  }

  addUser() {
    for (int i = 25; i <= 30; i++) {
      fsInstance.collection("doctors").doc(i.toString()).set({
        'name': "Emanuel Nov",
        "available": true,
        "department": "Nefrologji",
        "description":
            "Nefrolog me përvojë në diagnostikimin dhe trajtimin e sëmundjeve të sistemit të veshkave. Kam njohuri të thella të fiziologjisë së sistemit të veshkave dhe përdor teknika të ndryshme, si analiza e urinës dhe ultratingujt, për të ndihmuar në diagnostikimin e sëmundjeve."
      });
    }
  }
}
