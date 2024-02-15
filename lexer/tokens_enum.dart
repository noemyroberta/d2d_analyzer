part of d2d_analyzer;

enum TokenType {
  CLASS,
  IDENTIFIER,
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