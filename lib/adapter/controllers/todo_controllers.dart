import 'dart:io';
import 'package:clean_arc/adapter/gateways/my_local_db.dart';
import 'package:clean_arc/adapter/gateways/test_id_generator.dart';
import 'package:clean_arc/adapter/gateways/todo_security.dart';
import 'package:clean_arc/adapter/peremters/todo_presenter.dart';
import 'package:clean_arc/usecases/models/todo_response_model.dart';
import 'package:clean_arc/usecases/ports/i_todo_controller.dart';
import 'package:clean_arc/usecases/todo_usecase.dart';


class TodoController {
  final ITodoController controller;
  TodoController(this.controller);

  void saveForm(String data) {
    TodoRequestModel model = TodoRequestModel(data);
    final result = controller.saveTodo(model);
    print(result.message);
  }

  void listTodos() {
    final result = controller.fetchTodos();
    var todos = result.todos;
    if (todos != null) {
      for (var todo in todos) {
        print(todo);
      }
    }
  }
}

void main() {
  TodoController controller = TodoController(
    TodoUsecase(
      presenter: TodoPresenter(),
      idGenerator: TestIDGenerator(),
      gateway: MyLocalDB(),
      security: TodoSecurity(),
    ),
  );

  bool isRunning = true;
  while (isRunning) {
    stdout.write("Please enter a command: save, list, quit: ");
    String? command = stdin.readLineSync();
    if (command!.contains("save")) {
      stdout.write("Enter a todo: ");
      String? data = stdin.readLineSync();
      if (data != null) {
        controller.saveForm(data);
      }
    } else if (command.contains("list")) {
      controller.listTodos();
    } else if (command.contains("quit")) {
      isRunning = false;
    }
  }
}
