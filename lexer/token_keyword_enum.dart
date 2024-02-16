part of d2d_analyzer;

enum TokenKeywordType {
  CLASS,
  PRINT,
  VOID,
  ABSTRACT,
  INTERFACE,
  THIS,
  NULL,
  NEW,
  FINAL,
  STRING,
  INT,
  DOUBLE,
  FLOAT,
  CONST,
  SUPER,
  RETURN,
  UNKNOWN,
}

extension TokenKeywordUtil on TokenKeywordType {
  String get displayTitle {
    Map<TokenKeywordType, String> TokenKeywordTypeByEnum = {
      TokenKeywordType.CLASS: 'class',
      TokenKeywordType.PRINT: 'print',
      TokenKeywordType.VOID: 'void',
      TokenKeywordType.ABSTRACT: 'abstract',
      TokenKeywordType.INTERFACE: 'interface',
      TokenKeywordType.THIS: 'this',
      TokenKeywordType.NULL: 'null',
      TokenKeywordType.NEW: 'new',
      TokenKeywordType.FINAL: 'final',
      TokenKeywordType.STRING: 'String',
      TokenKeywordType.INT: 'int',
      TokenKeywordType.DOUBLE: 'double',
      TokenKeywordType.FLOAT: 'float',
      TokenKeywordType.CONST: 'const',
      TokenKeywordType.SUPER: 'super',
      TokenKeywordType.RETURN: 'return',
    };

    return TokenKeywordTypeByEnum[this] ?? TokenKeywordType.UNKNOWN.name;
  }
}
