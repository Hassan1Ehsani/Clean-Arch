import 'package:clean_arc/entities/todo.dart';

class TodoMapper {
  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
    );
  }

  static Map<String, dynamic> toJson(Todo todo) {
    return {
      'id': todo.id,
      "title": todo.title,
    };
  }
}
