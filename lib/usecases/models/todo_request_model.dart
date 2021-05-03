import 'package:clean_arc/entities/todo.dart';

class ResponseModel {
  final String? message;
  final List<Todo>? todos;
  const ResponseModel({this.message, this.todos = const []});
}
