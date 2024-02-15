part of d2d_analyzer;

class Lexer {
  final String input;
  int _currentPosition = 0;

  static final Set<String> keywords = {
    'class',
    'print',
    'void',
    'abstract',
    'interface',
    'this',
    'null',
    'new',
    'final',
    'String',
    'int',
    'double',
    'float',
    'const',
    'super',
    'return',
  };

  Lexer(this.input);

  Token? getNextToken() {
    if (_isAtEnd()) return null;

    final char = input[_currentPosition++];
    switch (char) {
      case '{':
        return Token(TokenType.OPEN_BRACE, char);
      case '}':
        return Token(TokenType.CLOSE_BRACE, char);
      case ';':
        return Token(TokenType.SEMICOLON, char);
      default:
        if (char == '_' || char == char.toUpperCase()) {
          final buffer = StringBuffer(char);
          while (!_isAtEnd() && (_isAlphaNumeric(peek() ?? ''))) {
            buffer.write(advance());
          }
          final lexeme = buffer.toString();
          final type = _isNotAKeyword(lexeme) //
              ? TokenType.INVALID
              : TokenType.IDENTIFIER;

          return Token(type, lexeme);
        }
        return Token(TokenType.INVALID, char);
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

  bool _isNotAKeyword(lexeme) => !keywords.contains(lexeme);

  bool _isAtEnd() => _currentPosition >= input.length;

  bool _isAlphaNumeric(String char) => RegExp(r'[a-zA-Z0-9_]').hasMatch(char);
}
