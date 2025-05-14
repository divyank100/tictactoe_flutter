import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/ResetButton.dart';
import '../components/StatusDisplay.dart';
import '../serrvice_provider/ServiceProvider.dart';
import 'GameBoard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late final serviceProvider = Provider.of<ServiceProvider>(
    context,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIC TAC TOE"),
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatusDisplay(),
             SizedBox(height: 20),
            GameBoard(),
            const SizedBox(height: 20),
            ResetButton(),
          ],
        )
    );
  }
}
