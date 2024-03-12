part of d2d_analyzer;

class Lexer {
  final String input;
  final int lineIndex;
  int _currentPosition = 0;

  Lexer(this.input, this.lineIndex);

  Token? getNextToken() {
    _skipWhitespace();

    if (_isAtEnd()) return null;

    final char = input[_currentPosition++];
    switch (char) {
      case '.':
        return Token(TokenType.OPERATOR, char, lineIndex);
      case ',':
        return Token(TokenType.OPERATOR, char, lineIndex);
      case '(':
        return Token(TokenType.OPERATOR, char, lineIndex);
      case ')':
        return Token(TokenType.OPERATOR, char, lineIndex);
      case '{':
        return Token(TokenType.OPERATOR, char, lineIndex);
      case '}':
        return Token(TokenType.OPERATOR, char, lineIndex);
      case ';':
        return Token(TokenType.OPERATOR, char, lineIndex);
      case '"':
        return Token(TokenType.OPERATOR, char, lineIndex);
      case '\$':
        return Token(TokenType.SPECIAL_CHAR, char, lineIndex);
      default:
        final buffer = StringBuffer(char);
        while (!_isAtEnd() && (_isAlphaNumeric(peek() ?? ""))) {
          buffer.write(advance());
        }
        final lexeme = buffer.toString();
        if (_isKeyword(lexeme)) {
          return Token(TokenType.KEYWORD, lexeme, lineIndex);
        } else if (_isIdentifier(lexeme)) {
          return Token(TokenType.IDENTIFIER, lexeme, lineIndex);
        } else if (_isLiteral(lexeme)) {
          return Token(TokenType.LITERAL, lexeme, lineIndex);
        }
        return Token(TokenType.INVALID, lexeme, lineIndex);
    }
  }

  bool _isKeyword(lexeme) {
    return (TokenKeywordType.values.firstWhere((e) => e.displayTitle == lexeme,
            orElse: () => TokenKeywordType.UNKNOWN) !=
        TokenKeywordType.UNKNOWN);
  }

  String? peek() {
    if (_isAtEnd()) return null;
    return input[_currentPosition];
  }

  String advance() {
    if (!_isAtEnd()) _currentPosition++;
    return input[_currentPosition - 1];
  }

  void _skipWhitespace() {
    while (!_isAtEnd() && _isWhitespace(peek() ?? '')) {
      advance();
    }
  }

  bool _isAtEnd() => _currentPosition >= input.length;

  bool _isIdentifier(String str) =>
      RegExp(r'^[a-zA-Z_][a-zA-Z0-9_]*$').hasMatch(str);

  bool _isAlphaNumeric(String char) => RegExp(r'[a-zA-Z0-9_]').hasMatch(char);

  bool _isWhitespace(String char) =>
      char == ' ' || char == '\t' || char == '\n' || char == '\r';
}
