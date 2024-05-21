import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Snackbar extends StatelessWidget {
  String messege;
  final Color color;
  final Color colorofbo;
  Snackbar(
      {required this.messege, required this.color, required this.colorofbo});
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text(
              "$messege",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )),
      Positioned(
        bottom: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
          child: SvgPicture.asset(
            'assets/image/bubbles.svg',
            semanticsLabel: 'My SVG Image',
            height: 40,
            width: 40,
            color: colorofbo,
          ),
        ),
      ),
      Positioned(
        top: -10,
        left: 0,
        child: Stack(alignment: Alignment.center, children: [
          SvgPicture.asset(
            'assets/image/fail.svg',
            semanticsLabel: 'My SVG Image',
            height: 40,
            color: colorofbo,
          ),
          Positioned(
            top: 10,
            child: ImageIcon(
              AssetImage("assets/image/danger.png"),
              size: 17,
              color: Colors.white,
            ),
          )
        ]),
      ),
    ]);
  }
}
