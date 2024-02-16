part of d2d_analyzer;

class Lexer {
  final String input;
  int _currentPosition = 0;

  Lexer(this.input);

  Token? getNextToken() {
    if (_isAtEnd()) return null;

    final char = input[_currentPosition++];
    switch (char) {
      case '.': 
        return Token(TokenType.PERIOD, char);
      case '{':
        return Token(TokenType.OPEN_BRACE, char);
      case '}':
        return Token(TokenType.CLOSE_BRACE, char);
      case ';':
        return Token(TokenType.SEMICOLON, char);
      default:
        final buffer = StringBuffer(char);
        while (!_isAtEnd() && (_isAlphaNumeric(peek() ?? ''))) {
          buffer.write(advance());
        }
        final lexeme = buffer.toString();

        if (TokenKeywordType.values.contains(lexeme.toUpperCase())) {
          return Token(TokenType.KEYWORD, lexeme);
        }
        return Token(TokenType.IDENTIFIER, lexeme);
    }
  }

  String? peek() {
    if (_isAtEnd()) return null;
    return input[_currentPosition];
  }

  String advance() {
    if (!_isAtEnd()) _currentPosition++;
    return input[_currentPosition - 1];
  }

  bool _isAtEnd() => _currentPosition >= input.length;

  bool _isAlphaNumeric(String char) => RegExp(r'[a-zA-Z0-9_]').hasMatch(char);
}
