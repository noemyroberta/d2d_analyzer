# D2D Lexical Analyzer

Analisador léxico de Dart para Dart.

## Instalação & Funcionamento

### Passo 1 - Clone o repositório

Clone esse repositório colando no seu terminal o seguinte comando:

``
git clone https://github.com/noemyroberta/d2d_analyzer.git
``

### Passo 2 - Instalando o Dart

Instale o Dart SDK [aqui](https://dart.dev/get-dart/archive) e verifique as configurações necessárias do seu Sistema Operacional.

### Passo 3 - Executando o projeto

Para executar o projeto com o código-fonte do arquivo `file.txt`, execute o seguinte comando no seu terminal:

``
dart run file_input.dart
``

e estará pronto!

**ATENÇÃO**: Tenha certeza de que está executando o comando acima na raiz do projeto.

**ATENÇÃO 2.**: Caso o pacote `Dart SDK` não esteja sendo reconhecido, tente reiniciar o seu sistema e tente novamente.

## Uso & Resultados Esperados

O analisador léxico verifica o código-fonte Dart escrito no arquivo `file.txt` e retorna um _log_ com a análise de _token_ e suas atribuições para cada linha do arquivo (atual com 10 linhas).

### Exemplo

Arquivo `file.txt`:

```dart
class MyClass {
    String name;
    int age;

    const MyClass(this.name, this.age);

    String toString() {
        return "$name, $age";
    }
}
```

### Saída Esperada

_Log_ do arquivo `file_input.dart`:

```txt
TokenType.IDENTIFIER | Lexeme: MyClass | Line: 1
TokenType.OPEN_BRACE | Lexeme: { | Line: 1
TokenType.KEYWORD | Lexeme: String | Line: 2
TokenType.IDENTIFIER | Lexeme: name | Line: 2
TokenType.SEMICOLON | Lexeme: ; | Line: 2
TokenType.KEYWORD | Lexeme: int | Line: 3
TokenType.IDENTIFIER | Lexeme: age | Line: 3
TokenType.SEMICOLON | Lexeme: ; | Line: 3
TokenType.KEYWORD | Lexeme: const | Line: 5
TokenType.IDENTIFIER | Lexeme: MyClass | Line: 5
TokenType.OPEN_PAREN | Lexeme: ( | Line: 5
TokenType.KEYWORD | Lexeme: this | Line: 5
TokenType.PERIOD | Lexeme: . | Line: 5
TokenType.IDENTIFIER | Lexeme: name | Line: 5
TokenType.COMMA | Lexeme: , | Line: 5
TokenType.KEYWORD | Lexeme: this | Line: 5
TokenType.PERIOD | Lexeme: . | Line: 5
TokenType.IDENTIFIER | Lexeme: age | Line: 5
TokenType.CLOSE_PAREN | Lexeme: ) | Line: 5
TokenType.SEMICOLON | Lexeme: ; | Line: 5
TokenType.KEYWORD | Lexeme: String | Line: 7
TokenType.IDENTIFIER | Lexeme: toString | Line: 7
TokenType.OPEN_PAREN | Lexeme: ( | Line: 7
TokenType.CLOSE_PAREN | Lexeme: ) | Line: 7
TokenType.OPEN_BRACE | Lexeme: { | Line: 7
TokenType.KEYWORD | Lexeme: return | Line: 8
TokenType.DOUBLE_QUOT | Lexeme: " | Line: 8
TokenType.DOLLAR_SIGN | Lexeme: $ | Line: 8
TokenType.IDENTIFIER | Lexeme: name | Line: 8
TokenType.COMMA | Lexeme: , | Line: 8
TokenType.DOLLAR_SIGN | Lexeme: $ | Line: 8
TokenType.IDENTIFIER | Lexeme: age | Line: 8
TokenType.DOUBLE_QUOT | Lexeme: " | Line: 8
TokenType.SEMICOLON | Lexeme: ; | Line: 8
TokenType.CLOSE_BRACE | Lexeme: } | Line: 9
TokenType.CLOSE_BRACE | Lexeme: } | Line: 10
File reading complete.
```

### Explicação Adicional

Cada linha da saída esperada tem o seguinte significado:

- `TokenType`: Tipo de _token_, podendo ser vírgula, ponto e vírgula, etc.
- `Lexeme`: O caracter analisado.
- `Line`: Número da linha analisada.

## Tecnologias Utilizadas

- Criado em `Dart` para identificar escopos escritos em `Dart`.
