import 'dart:async';
import 'dart:io';

import '../d2d_analyzer.dart';

Future<void> main() async {
  try {
   // var file = File('file_input/file.txt');
    //var contents = await file.readAsString();

    final input = '''
    class MyClass {
      int x;
      String name;
    }
  ''';
    print(input);
    executeLexer(input);
  } catch (e) {
    print('Error reading file: $e');
  }
}

void executeLexer(String fileInput) {
  final lexer = Lexer(fileInput);
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
