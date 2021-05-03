import 'dart:math';

import 'package:clean_arc/usecases/ports/todo_id_generator.dart';

class TestIDGenerator implements TodoIDGenerator {
  @override
  String generateID() {
    Random random = Random();
    final newID = random.nextInt(89999) + 10000;
    return newID.toString();
  }
}
