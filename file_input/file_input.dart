import 'dart:async';
import 'dart:io';

Future<void> main() async {
  try {
    var file = File('file_input/file.txt');
    var contents = await file.readAsString();
    print(contents);
  } catch (e) {
    print('Error reading file: $e');
  }
}