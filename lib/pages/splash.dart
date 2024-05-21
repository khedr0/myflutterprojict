import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../checking/auth_page.dart';

class Splash_screan extends StatefulWidget {
  static const String routename = 'splash';

  const Splash_screan({super.key});

  @override
  State<Splash_screan> createState() => _Splash_screanState();
}

class _Splash_screanState extends State<Splash_screan>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushNamed(AuthPage.routename);
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
          image: AssetImage(
              "assets/image/Printable Blank Tic Tac Toe Sheet Templates [PDF.jpeg")),
    );
  }
}
