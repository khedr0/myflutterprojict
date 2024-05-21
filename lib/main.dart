import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xo/pages/splash.dart';

import 'checking/auth_page.dart';
import 'firebase_options.dart';
import 'pages/Board.dart';
import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Splash_screan.routename,
      routes: {
        Splash_screan.routename: (context) => Splash_screan(),
        AuthPage.routename: (context) => AuthPage(),
        // LoginPage.routename: (context) => LoginPage(),
        Login.routename: (context) => Login(),
        Board.routename: (context) => Board()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
