import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/screens/easy_screen.dart';
import 'package:tic_tac_toe_flutter/screens/medium_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Image(
              image: AssetImage('images/tictactoe.png'),
              height: 80,
              width: 80,
            ),
            Text('Tic Tac Toe'),
            SizedBox(
              height: 40,
            ),
            _getElevatedButton('Easy 3*3', context, EasyScreen()),
            SizedBox(
              height: 12,
            ),
            _getElevatedButton('Medium 5*5', context, MadiumScreen())
          ],
        ),
      ),
    );
  }

  Widget _getElevatedButton(String text, BuildContext context, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return screen;
          }),
        );
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey,
        shadowColor: Colors.blueGrey,
        minimumSize: Size(120, 40),
        elevation: 3,
      ),
    );
  }
}
