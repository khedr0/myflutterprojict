import 'package:flutter/cupertino.dart';
import 'package:xo/pages/login_page.dart';

import '../pages/RigisterPage.dart';

class LoginorRigisterPage extends StatefulWidget {
  const LoginorRigisterPage({super.key});

  @override
  State<LoginorRigisterPage> createState() => _LoginorRigisterPageState();
}

class _LoginorRigisterPageState extends State<LoginorRigisterPage> {
  bool showlogin = true;

  void togglepage() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return LoginPage(onTap: togglepage);
    } else {
      return RigisterPage(
        onTap: togglepage,
      );
    }
  }
}
