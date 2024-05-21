import 'package:flutter/material.dart';
import 'package:xo/widgets/xobuttonStyle.dart';

class Button extends StatelessWidget {
  String text;
  int index;
  Function onbuttonclick;
  Button(
      {required this.text, required this.index, required this.onbuttonclick}) {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(5),
            child: ElevatedButton(
              style: btnprimaryxo,
              onPressed: () {
                onbuttonclick(index);
              },
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "$text",
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                ),
              ),
            )));
  }
}
