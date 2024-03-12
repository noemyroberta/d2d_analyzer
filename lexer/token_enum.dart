part of d2d_analyzer;

enum TokenType {
  KEYWORD,
  OPERATOR,
  STRING,
  IDENTIFIER,
  INVALID,
  SPECIAL_CHAR,
}

class Token {
  final TokenType type;
  final String lexeme;
  final int lineIndex;

  Token(this.type, this.lexeme, this.lineIndex);

  @override
  String toString() => '$type | Lexeme: $lexeme | Line: $lineIndex';
}
