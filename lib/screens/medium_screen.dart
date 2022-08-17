import 'package:flutter/material.dart';

class MadiumScreen extends StatefulWidget {
  MadiumScreen({Key? key}) : super(key: key);

  @override
  State<MadiumScreen> createState() => _MadiumScreenState();
}

class _MadiumScreenState extends State<MadiumScreen> {
  GlobalKey _toolTipKey = GlobalKey();

  bool isTurnO = true;

  var xOroList = List.filled(25, '');

  bool gameHasResult = false;
  int scoreO = 0;
  int scoreX = 0;

  String winnerTitle = '';
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: _getAppbar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            _getScoreBoard(),
            SizedBox(
              height: 24,
            ),
            _getGrideView(),
            SizedBox(
              height: 8,
            ),
            _getResultButton(),
            SizedBox(
              height: 110,
            ),
            //get turn exhibition
            _getText(isTurnO ? 'Turn O' : 'Turn X', 22, Colors.white),
            SizedBox(
              width: 82,
              child: Divider(
                thickness: 2,
                height: 6,
                color: Colors.white38,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _getAppbar() {
    return AppBar(
      title: Text('Tic Tac Toe'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            final dynamic _toolTip = _toolTipKey.currentState;
            _toolTip.ensureTooltipVisible();
            scoreO = 0;
            scoreX = 0;
            _clearGame();
          },
          icon: Tooltip(
            key: _toolTipKey,
            message: "Reset Game",
            child: Icon(Icons.refresh),
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.1,
    );
  }

  Widget _getScoreBoard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _getText('Player O', 18, Colors.white70),
              _getText('$scoreO', 32, Colors.white),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              _getText('Player X', 18, Colors.white70),
              _getText('$scoreX', 32, Colors.orange),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getText(String text, double fSize, Color tColor) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fSize,
        color: tColor,
      ),
    );
  }

  Widget _getGrideView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 25,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => _tapped(index),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: _getText(xOroList[index], 50,
                  xOroList[index] == 'O' ? Colors.white : Colors.orange),
            ),
          ),
        );
      },
    );
  }

  void _tapped(int index) {
    setState(() {
      //returns when game has result
      if (gameHasResult) {
        return;
      }
      //returns when the clicked index is not empty
      if (xOroList[index] != '') {
        return;
      }

      if (isTurnO) {
        xOroList[index] = 'O';
        filledBoxes = filledBoxes + 1;
      } else {
        xOroList[index] = 'X';
        filledBoxes = filledBoxes + 1;
      }
      isTurnO = !isTurnO;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (xOroList[0] == xOroList[1] &&
        xOroList[0] == xOroList[2] &&
        xOroList[0] == xOroList[3] &&
        xOroList[0] == xOroList[4] &&
        xOroList[0] != '') {
      _setGameResult(xOroList[0], 'Winner is player ' + xOroList[0]);
      return;
    }

    if (xOroList[5] == xOroList[6] &&
        xOroList[5] == xOroList[7] &&
        xOroList[5] == xOroList[8] &&
        xOroList[5] == xOroList[9] &&
        xOroList[5] != '') {
      _setGameResult(xOroList[5], 'Winner is player ' + xOroList[5]);
      return;
    }

    if (xOroList[10] == xOroList[11] &&
        xOroList[10] == xOroList[12] &&
        xOroList[10] == xOroList[13] &&
        xOroList[10] == xOroList[14] &&
        xOroList[10] != '') {
      _setGameResult(xOroList[10], 'Winner is player ' + xOroList[10]);
      return;
    }

    if (xOroList[15] == xOroList[16] &&
        xOroList[15] == xOroList[17] &&
        xOroList[15] == xOroList[18] &&
        xOroList[15] == xOroList[19] &&
        xOroList[15] != '') {
      _setGameResult(xOroList[15], 'Winner is player ' + xOroList[15]);
      return;
    }

    if (xOroList[20] == xOroList[21] &&
        xOroList[20] == xOroList[22] &&
        xOroList[20] == xOroList[23] &&
        xOroList[20] == xOroList[24] &&
        xOroList[20] != '') {
      _setGameResult(xOroList[20], 'Winner is player ' + xOroList[20]);
      return;
    }

    if (xOroList[0] == xOroList[5] &&
        xOroList[0] == xOroList[10] &&
        xOroList[0] == xOroList[15] &&
        xOroList[0] == xOroList[20] &&
        xOroList[0] != '') {
      _setGameResult(xOroList[0], 'Winner is player ' + xOroList[0]);
      return;
    }

    if (xOroList[1] == xOroList[6] &&
        xOroList[1] == xOroList[11] &&
        xOroList[1] == xOroList[16] &&
        xOroList[1] == xOroList[21] &&
        xOroList[1] != '') {
      _setGameResult(xOroList[1], 'Winner is player ' + xOroList[1]);
      return;
    }

    if (xOroList[2] == xOroList[7] &&
        xOroList[2] == xOroList[12] &&
        xOroList[2] == xOroList[17] &&
        xOroList[2] == xOroList[22] &&
        xOroList[2] != '') {
      _setGameResult(xOroList[2], 'Winner is player ' + xOroList[2]);
      return;
    }

    if (xOroList[3] == xOroList[8] &&
        xOroList[3] == xOroList[13] &&
        xOroList[3] == xOroList[18] &&
        xOroList[3] == xOroList[23] &&
        xOroList[3] != '') {
      _setGameResult(xOroList[3], 'Winner is player ' + xOroList[3]);
      return;
    }

    if (xOroList[4] == xOroList[9] &&
        xOroList[4] == xOroList[14] &&
        xOroList[4] == xOroList[19] &&
        xOroList[4] == xOroList[24] &&
        xOroList[4] != '') {
      _setGameResult(xOroList[4], 'Winner is player ' + xOroList[4]);
      return;
    }

    if (xOroList[0] == xOroList[6] &&
        xOroList[0] == xOroList[12] &&
        xOroList[0] == xOroList[18] &&
        xOroList[0] == xOroList[24] &&
        xOroList[0] != '') {
      _setGameResult(xOroList[0], 'Winner is player ' + xOroList[0]);
      return;
    }

    if (xOroList[4] == xOroList[8] &&
        xOroList[4] == xOroList[12] &&
        xOroList[4] == xOroList[16] &&
        xOroList[4] == xOroList[20] &&
        xOroList[4] != '') {
      _setGameResult(xOroList[4], 'Winner is player ' + xOroList[4]);
      return;
    }

    if (filledBoxes == 25) {
      _setGameResult('', 'Draw');
    }
  }

  void _setGameResult(String winner, String title) {
    setState(() {
      gameHasResult = true;
      winnerTitle = title;
      if (winner == 'O') {
        scoreO = scoreO + 1;
      } else if (winner == 'X') {
        scoreX = scoreX + 1;
      } else {
        scoreO = scoreO + 1;
        scoreX = scoreX + 1;
      }
    });
  }

  Widget _getResultButton() {
    return Visibility(
      visible: gameHasResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white70),
        ),
        onPressed: () => _clearGame(),
        child: _getText('$winnerTitle, play again', 16, Colors.white),
      ),
    );
  }

  void _clearGame() {
    setState(() {
      gameHasResult = false;
      for (var i = 0; i < xOroList.length; i++) {
        xOroList[i] = '';
      }
    });
    filledBoxes = 0;
    winnerTitle = '';
  }
}
