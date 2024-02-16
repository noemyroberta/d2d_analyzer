part of d2d_analyzer;

enum TokenType {
  KEYWORD,
  IDENTIFIER,
  STRINGS,
  OPEN_BRACE,
  CLOSE_BRACE,
  SEMICOLON,
  PERIOD,
  COMMA,
  OPEN_PAREN,
  CLOSE_PAREN,
  DOUBLE_QUOT,
  DOLLAR_SIGN,
  INVALID,
}

class Token {
  final TokenType type;
  final String lexeme;
  final int lineIndex;

  Token(this.type, this.lexeme, this.lineIndex);

  @override
  String toString() => 'Type: $type | Lexeme: $lexeme | Line: $lineIndex';
}
