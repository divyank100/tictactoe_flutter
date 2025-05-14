import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../serrvice_provider/ServiceProvider.dart';

class StatusDisplay extends StatefulWidget {
  const StatusDisplay({super.key});

  @override
  State<StatusDisplay> createState() => _StatusDisplayState();
}

class _StatusDisplayState extends State<StatusDisplay> {
  late final gameModel = Provider.of<ServiceProvider>(context);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Current player ${gameModel.currentPlayerSymbol}"),
        if (gameModel.winner != null && gameModel.winner == true)
          Text("Winner player X"),
        if (gameModel.winner != null && gameModel.winner == false)
          Text("Winner player O"),
      ],
    );
  }
}
