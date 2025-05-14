import 'package:flutter/cupertino.dart';

class ServiceProvider extends ChangeNotifier {
  List<List<bool?>> _board = List.generate(3, (_) => List.filled(3, null));
  bool _isXTurn = true;
  bool? _winner;
  bool _isDraw = false;

  List<List<bool?>> get board => _board;

  bool get isXTurn => _isXTurn;

  bool? get winner => _winner;

  bool get isDraw => _isDraw;

  String get currentPlayerSymbol => _isXTurn ? 'X' : 'O';

  String get status {
    if (_winner != null) {
      return "${_winner! ? 'X' : 'O'} wins!";
    } else {
      return "Player ${_isXTurn ? 'X' : 'O'}'s turn";
    }
  }

  void makeMove(int row, int col) {
    if (_board[row][col] != null || _winner != null || _isDraw) {
      return;
    }
    _board[row][col] = _isXTurn;

    _checkWinner();

    if (_winner == null) {
      _checkDraw();
    }

    if (_winner == null && !_isDraw) {
      _isXTurn = !_isXTurn;
    }

    notifyListeners();
  }

  void _checkWinner() {
    for (int i = 0; i < 3; i++) {
      if (_board[i][0] != null &&
          _board[i][0] == _board[i][1] &&
          _board[i][1] == _board[i][2]) {
        _winner = _board[i][0];
        return;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (_board[0][i] != null &&
          _board[0][i] == _board[1][i] &&
          _board[1][i] == _board[2][i]) {
        _winner = _board[0][i];
        return;
      }
    }

    if (_board[0][0] != null &&
        _board[0][0] == _board[1][1] &&
        _board[1][1] == _board[2][2]) {
      _winner = _board[0][0];
      return;
    }

    if (_board[0][2] != null &&
        _board[0][2] == _board[1][1] &&
        _board[0][2] == _board[1][1]) {
      _winner = _board[0][0];
      return;
    }
  }

  void _checkDraw() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_board[i][j] == null) {
          return;
        }
      }
    }
    _isDraw = true;
  }

  void resetGame() {
    _board = List.generate(3, (_) => List.filled(3, null));
    _isXTurn = true;
    _winner = null;
    _isDraw = false;
    notifyListeners();
  }
}
