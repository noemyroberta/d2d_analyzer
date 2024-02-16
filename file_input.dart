import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'd2d_analyzer.dart';

Future<void> main() async {
  try {
    var file = File('file.txt');
    var linesStream = file
        .openRead() //
        .transform(utf8.decoder) //
        .transform(LineSplitter());

    int lineIndex = 0;
    linesStream.listen((line) {
      lineIndex++;
      executeLexer(line, lineIndex);
    }, onDone: () {
      print('File reading complete.');
    }, onError: (e) {
      print('Error reading file: $e');
    });
  } catch (e) {
    print('Error reading file: $e');
  }
}

void executeLexer(String fileInput, int lineIndex) {
  final lexer = Lexer(fileInput, lineIndex);
  Token? token;
  do {
    token = lexer.getNextToken();
    if (token != null && token.type != TokenType.INVALID) {
      print(token);
    } else if (token != null) {
      print('Invalid token: ${token.lexeme}');
    }
  } while (token != null);
}
