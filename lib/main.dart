import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spitali_im/ui/navigation/nav.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

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
        body: MainNavigation(),
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       // for (int i = 21; i <= 26; i++) {
        //       fsInstance.collection("doctors").doc("3").set({
        //         'name': "Gentrim Canolli",
        //         "available": true,
        //         "department": "Kardiologji",
        //         "description": "Nefrolog i forte",
        //       });
        //     },
        //     // },
        //     child: Text("Add"),
        //   ),
        // ),
      ),
    );
  }
}
