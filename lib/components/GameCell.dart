import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/serrvice_provider/ServiceProvider.dart';

class GameCell extends StatelessWidget {
  final int row;
  final int col;

  const GameCell({super.key, required this.row, required this.col});

  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<ServiceProvider>(context);
    final cellValue = gameModel.board[row][col];

    return GestureDetector(
      onTap: () => gameModel.makeMove(row, col),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            cellValue == null ? '' : (cellValue ? 'X' : 'O'),
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: cellValue == null
                  ? Colors.transparent
                  : (cellValue ? Colors.blue.shade800 : Colors.red.shade800),
            ),
          ),
        ),
      ),
    );
  }
}