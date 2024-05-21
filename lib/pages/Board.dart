import 'package:flutter/material.dart';
import 'package:xo/widgets/snackbar_content.dart';
import 'package:xo/widgets/xobutton.dart';

import 'login.dart';

class Board extends StatefulWidget {
  static const String routename = 'board';
  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<String> boardstate = ['', '', '', '', '', '', '', '', ''];
  int player1s = 0;
  int player2s = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "TIC TAC TOE Game",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //   image: AssetImage("assets/image/background xo.jpeg"),
          //   fit: BoxFit.cover,
          // )),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${Login.playerx}(X)",
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  "$player1s",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${Login.playero}(O)",
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  "$player2s",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.black12),
                          child: Center(
                            child: Text(
                              "${whosturn()} Turn's",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                    text: boardstate[0],
                    index: 0,
                    onbuttonclick: onbuttonclick,
                  ),
                  Button(
                    text: boardstate[1],
                    index: 1,
                    onbuttonclick: onbuttonclick,
                  ),
                  Button(
                    text: boardstate[2],
                    index: 2,
                    onbuttonclick: onbuttonclick,
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                    text: boardstate[3],
                    index: 3,
                    onbuttonclick: onbuttonclick,
                  ),
                  Button(
                    text: boardstate[4],
                    index: 4,
                    onbuttonclick: onbuttonclick,
                  ),
                  Button(
                    text: boardstate[5],
                    index: 5,
                    onbuttonclick: onbuttonclick,
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                    text: boardstate[6],
                    index: 6,
                    onbuttonclick: onbuttonclick,
                  ),
                  Button(
                    text: boardstate[7],
                    index: 7,
                    onbuttonclick: onbuttonclick,
                  ),
                  Button(
                    text: boardstate[8],
                    index: 8,
                    onbuttonclick: onbuttonclick,
                  ),
                ],
              )),
              // GridView.builder(
              //   gridDelegate:
              //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              //   itemBuilder: (BuildContext context, int index) {
              //     return Container(
              //       color: Colors.blue,
              //       height: 100,
              //       width: 300,
              //       child: Text("XXXXXXX"),
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

  int counter = 0;
  bool isx = true;

  void onbuttonclick(int index) {
    if (boardstate[index].isNotEmpty) {
      return;
    } else if (counter % 2 == 0) {
      if (isx) {
        boardstate[index] = 'X';
      } else {
        boardstate[index] = 'O';
      }
    } else {
      if (!isx) {
        boardstate[index] = 'X';
      } else {
        boardstate[index] = 'O';
      }
    }
    counter++;
    if (checkwinner("X")) {
      player1s++;
      isx = !isx;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Snackbar(
            messege: "${Login.playerx} Wins!!",
            color: Color(0xff2d694e),
            colorofbo: Color(0xff1e4534),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
      initboard();
    } else if (checkwinner("O")) {
      player2s++;
      isx = !isx;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Snackbar(
            messege: "${Login.playero} Wins!!",
            color: Color(0xff2d694e),
            colorofbo: Color(0xff1e4534),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
      initboard();
    } else if (counter == 9) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Snackbar(
            messege: "--Draw--",
            color: Color(0xFFFAA551),
            colorofbo: Color(0xfff98b20),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
      initboard();
    }
    setState(() {});
  }

  String turn = "";
  String whosturn() {
    if (isx) {
      if (counter % 2 == 0) {
        return turn = Login.playerx;
      } else {
        return turn = Login.playero!;
      }
    } else {
      if (!(counter % 2 == 0)) {
        return turn = Login.playerx;
      } else {
        return turn = Login.playero!;
      }
    }
  }

  bool checkwinner(String symbol) {
    for (int i = 0; i < 7; i += 3) {
      if (boardstate[i] == symbol &&
          boardstate[i + 1] == symbol &&
          boardstate[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i += 1) {
      if (boardstate[i] == symbol &&
          boardstate[i + 3] == symbol &&
          boardstate[i + 6] == symbol) {
        return true;
      }
    }
    if (boardstate[0] == symbol &&
        boardstate[4] == symbol &&
        boardstate[8] == symbol) {
      return true;
    }
    if (boardstate[2] == symbol &&
        boardstate[4] == symbol &&
        boardstate[6] == symbol) {
      return true;
    }
    return false;
  }

  void initboard() {
    counter = 0;
    boardstate = ['', '', '', '', '', '', '', '', ''];
  }
}
