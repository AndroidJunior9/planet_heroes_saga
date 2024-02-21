import 'dart:math';

class GameController {
  final List<List<String>> board;
  final List<String> candyColors = [
    "red",
    "green",
    "blue",
    "yellow",
    "orange",
    "purple"
  ];

  GameController()
      : board = List.generate(9, (i) => List.generate(9, (j) => ""));

  void generateBoard() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        int index = Random().nextInt(candyColors.length);
        board[i][j] = candyColors[index];
      }
    }
  }
}
