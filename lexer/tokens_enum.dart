enum TokenType {
  CLASS,
  IDENTIFIER,
  OPEN_BRACE,
  CLOSE_BRACE,
  SEMICOLON,
}

class Token {
  final TokenType type;
  final String lexeme;

  Token(this.type, this.lexeme);

  @override
  String toString() => '$type $lexeme';
}