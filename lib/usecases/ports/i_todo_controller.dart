import 'package:clean_arc/usecases/models/todo_request_model.dart';
import 'package:clean_arc/usecases/models/todo_response_model.dart';


abstract class ITodoController {
  ResponseModel saveTodo(TodoRequestModel requestModel);
  ResponseModel fetchTodos();
}
