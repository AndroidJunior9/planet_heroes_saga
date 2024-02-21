import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> candyColors = [
      ["red", "green", "blue", "yellow", "orange", "purple"],
      ["purple", "yellow", "green", "blue", "red", "orange"],
      // Add more rows of candy colors as needed
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Candy Crush Board')),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 9, // Adjust the number of columns as needed
            mainAxisSpacing: 0, // Remove vertical spacing
            crossAxisSpacing: 0, // Remove horizontal spacing
          ),
          itemCount: 81,
          itemBuilder: (context, index) {
            final row = index ~/ 9;
            final col = index % 9;
            final candyColor = candyColors[row % candyColors.length]
                [col % candyColors[0].length];

            return Container(
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color for each grid
                border: Border.all(color: Colors.black), // Add grid borders
              ),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: _getColor(candyColor),
                  radius: 20, // Adjust the size of the candy ball
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getColor(String candyColor) {
    switch (candyColor) {
      case "red":
        return Colors.red;
      case "green":
        return Colors.green;
      case "blue":
        return Colors.blue;
      case "yellow":
        return Colors.yellow;
      case "orange":
        return Colors.orange;
      case "purple":
        return Colors.purple;
      default:
        return Colors.grey; // Fallback color
    }
  }
}

void main() {
  runApp(MaterialApp(home: Board()));
}
