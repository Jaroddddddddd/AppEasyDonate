import 'package:app_easy_donate/pages/donateme.dart';
import 'package:app_easy_donate/pages/homeONG.dart';
import 'package:app_easy_donate/pages/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:app_easy_donate/pages/donatepage.dart';
import 'package:app_easy_donate/pages/helpUs.dart';
import 'package:app_easy_donate/pages/homepage.dart';
import 'package:app_easy_donate/pages/join.dart';
import 'package:app_easy_donate/pages/loginpage.dart';
import 'package:app_easy_donate/pages/submit.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main()  async{
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.homeONG: (context) => const HomeONG(),
        MyRoutes.registerRoute: ((context) => const RegisterPage()),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.donateRoute: (context) => DonatePage(),
        MyRoutes.submitRoute: (context) => Submitted(),
        MyRoutes.helpUsRoute: (context) => HelpUs(),
        MyRoutes.JoinUsRoute: (context) => JoinUs(),
        MyRoutes.donatemeRoute: (context) => DonatemePage(),
      },
    );
  }
}
