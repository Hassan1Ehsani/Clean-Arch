import 'package:clean_arc/usecases/ports/i_todo_gateway.dart';

class MyLocalDB implements ITodoGateway {
  List<Map<String, dynamic>> listOfTodos = [];
  @override
  void cacheTodo(Map<String, dynamic> todo) {
    listOfTodos.add(todo);
  }

  @override
  List<Map<String, dynamic>> getTodos() {
    return listOfTodos;
  }
}
