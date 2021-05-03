import 'package:clean_arc/entities/todo.dart';
import 'package:test/test.dart';

void main() {
  Todo? todo;
  group("Testing the Todo Entity ", () {
    setUp(() {
      todo = Todo(id: "123242343", title: "Work hard and hard nand hard and hard");
    });
    test('Todo Id Validator', () async {
      expect(todo!.isIdValid(), true);
    });

    test('Todo Tile validator', () async {
      expect(todo!.isTitleValid(), true);
    });
  });
}
