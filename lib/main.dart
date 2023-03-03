// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, camel_case_types

import 'package:flutter/material.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tic Tae Toe',
        home: Tictactoe());
  }
}

class Tictactoe extends StatefulWidget {
  const Tictactoe({super.key});

  @override
  State<Tictactoe> createState() => _TictactoeState();
}

class _TictactoeState extends State<Tictactoe> {
  Color fontcolor = Colors.black;
  var win = '';
  var playerO = 'O';
  var playerX = 'X';
  var turn = 'Player O Turn';
  int fill = 0;
  List box = List.filled(9, '');
  bool Oturn = true;
  void _ontap(int index) {
    setState(
      () {
        if (Oturn && box[index] == '' && fill < 10) {
          box[index] = 'O';
          fill++;
          turn = 'Player X Turn';
        } else if (!Oturn && box[index] == '' && fill < 10) {
          box[index] = 'X';
          fill++;
          turn = 'Player O Turn';
        }
        Oturn = !Oturn;
        winner();
      },
    );
  }

  void reset() {
    setState(() {
      box = List.filled(9, '');
      turn = 'Player O Turn';
      win = '';
      fill = 0;
    });
  }

  void winner() {
    if (box[0] == box[1] && box[0] == box[2] && box[0] != '') {
      setState(() {
        win = '${'Player ' + box[0]} win';
        turn = 'Game Over';

        fill = 10;
      });
    } else if (box[3] == box[4] && box[3] == box[5] && box[3] != '') {
      setState(() {
        win = '${'Player ' + box[3]} win';
        turn = 'Game Over';
        fill = 10;
      });
    } else if (box[6] == box[7] && box[6] == box[8] && box[6] != '') {
      setState(() {
        win = '${'Player' + box[6]} win';
        turn = 'Game Over';
        fill = 10;
      });
    } else if (box[0] == box[3] && box[3] == box[6] && box[0] != '') {
      setState(() {
        win = '${'Player ' + box[3]} win';
        turn = 'Game Over';
        fill = 10;
      });
    } else if (box[1] == box[4] && box[1] == box[7] && box[1] != '') {
      setState(() {
        win = '${'Player ' + box[1]} win';
        turn = 'Game Over';
        fill = 10;
      });
    } else if (box[2] == box[8] && box[2] == box[5] && box[2] != '') {
      setState(() {
        win = '${'Player ' + box[2]} win';
        turn = 'Game Over';
        fill = 10;
      });
    } else if (box[0] == box[4] && box[0] == box[8] && box[0] != '') {
      setState(() {
        win = '${'Player ' + box[0]} win';
        turn = 'Game Over';
        fill = 10;
      });
    } else if (box[2] == box[4] && box[2] == box[6] && box[2] != '') {
      setState(() {
        win = '${'Player ' + box[2]} win';
        turn = 'Game Over';
        fill = 10;
      });
    }
    if (fill == 9) {
      setState(() {
        turn = 'Game Over';
        win = 'Tie';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 145, 121),
      appBar: AppBar(
        title: const Text(
          'TicTacToe',
          style:
              TextStyle(color: Color.fromARGB(255, 12, 23, 42), fontSize: 40),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
        child: Column(
          children: [
            //To know the turn
            Container(
              height: 60,
              width: double.infinity,
              color: const Color.fromARGB(255, 237, 44, 10),
              child: Text(
                turn,
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.greenAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            //Boxes for game
            Expanded(
              flex: 2,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: ((BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _ontap(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 5, color: Colors.redAccent),
                      ),
                      child: Text(
                        box[index],
                        style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: fontcolor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }),
              ),
            ),
            //Winner board
            Expanded(
              child: Text(
                win,
                style: const TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 232, 6, 96),
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Reset the game
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 124, 191),
                  ),
                  onPressed: reset,
                  child: const FittedBox(
                    child: Text(
                      'Reset',
                      style: TextStyle(fontSize: 40, color: Colors.black54),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
