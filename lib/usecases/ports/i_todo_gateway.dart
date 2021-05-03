abstract class ITodoGateway {
  void cacheTodo(Map<String, dynamic> todo);
  List<Map<String, dynamic>> getTodos();
}
