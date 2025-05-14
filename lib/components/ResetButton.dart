import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/serrvice_provider/ServiceProvider.dart';

class ResetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<ServiceProvider>(context);

    return ElevatedButton(
      onPressed: gameModel.resetGame,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
      child: const Text(
        'New Game',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}