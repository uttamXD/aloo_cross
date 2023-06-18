import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // To add Icon Image
  var cross = Icon(
    Icons.cancel,
    size: 80,
  );
  var circle = Icon(
    Icons.circle,
    size: 80,
  );
  var edit = Icon(
    Icons.edit,
    size: 80,
  );

  bool isCross = true;
  String? message;
  List<String>? gameState;

  // Initialize Box with Empty Value

  @override
  void initState() {
    gameState = List.filled(9, 'empty');
    message = "";
    super.initState();
  }

  //To Play Game
  playGame(int index) {
    if (this.gameState?[index] == 'empty') {
      setState(() {
        if (this.isCross) {
          this.gameState![index] = 'cross';
        } else {
          this.gameState![index] = 'circle';
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  //Reset Game
  resetGame() {
    setState(() {
      gameState = List.filled(9, 'empty');
      this.message = "";
    });
  }

  //To get icon image
  Icon getIcon(String title) {
    switch (title) {
      case ('cross'):
        return cross;

      case ('circle'):
        return circle;
    }
    return edit;
  }

  //To check for winning
  checkWin() {
    if ((gameState![0] != 'empty') &&
        (gameState![0] == gameState![1]) &&
        (gameState![1] == gameState![2])) {
      setState(() {
        message = gameState![0] + ' wins';
      });
    } else if ((gameState![3] != 'empty') &&
        (gameState![3] == gameState![4]) &&
        (gameState![4] == gameState![5])) {
      setState(() {
        message = gameState![3] + ' wins';
      });
    } else if ((gameState![6] != 'empty') &&
        (gameState![6] == gameState![7]) &&
        (gameState![7] == gameState![8])) {
      setState(() {
        message = gameState![6] + ' wins';
      });
    } else if ((gameState![0] != 'empty') &&
        (gameState![0] == gameState![3]) &&
        (gameState![3] == gameState![6])) {
      setState(() {
        message = gameState![0] + ' wins';
      });
    } else if ((gameState![1] != 'empty') &&
        (gameState![1] == gameState![4]) &&
        (gameState![4] == gameState![7])) {
      setState(() {
        message = gameState![1] + ' wins';
      });
    } else if ((gameState![2] != 'empty') &&
        (gameState![2] == gameState![5]) &&
        (gameState![5] == gameState![8])) {
      setState(() {
        message = gameState![2] + ' wins';
      });
    } else if ((gameState![0] != 'empty') &&
        (gameState![0] == gameState![4]) &&
        (gameState![4] == gameState![8])) {
      setState(() {
        message = gameState![0] + ' wins';
      });
    } else if ((gameState![2] != 'empty') &&
        (gameState![2] == gameState![4]) &&
        (gameState![4] == gameState![7])) {
      setState(() {
        message = gameState![2] + ' wins';
      });
    } else if (!gameState!.contains('empty')) {
      setState(() {
        message = "Game is Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Tic Tac Toe'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: gameState?.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100,
                  height: 100,
                  child: MaterialButton(
                    onPressed: () {
                      playGame(i);
                    },
                    child: getIcon(gameState![i]),
                  ),
                ),
              ),
            ),
            Text(
              message!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            MaterialButton(
              color: Colors.blue[800],
              minWidth: 200,
              onPressed: () {
                resetGame();
              },
              child: Text(
                'Reset Game',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ));
  }
}
