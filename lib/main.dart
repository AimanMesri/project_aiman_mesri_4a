import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/firebase_options.dart';
import 'package:project/homepage.dart';
import 'package:project/iot.dart';
import 'package:project/led.dart';
import 'package:project/signin.dart';
import 'package:project/signup.dart';
import 'package:project/iot-monitoring.dart';
import 'package:project/pumpctrl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: pmct(),

     // initialRoute: '/',

     // routes: {
     // '/': (context) => Iotmonitoring(),

     // },
    );
  }
}