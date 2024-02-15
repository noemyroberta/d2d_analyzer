part of d2d_analyzer;

enum TokenType {
  KEYWORD,
  IDENTIFIER,
  STRINGS,
  OPEN_BRACE,
  CLOSE_BRACE,
  SEMICOLON,
  INVALID,
}

class Token {
  final TokenType type;
  final String lexeme;

  Token(this.type, this.lexeme);

  @override
  String toString() => '$type $lexeme';
}
