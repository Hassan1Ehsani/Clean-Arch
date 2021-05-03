import 'package:clean_arc/entities/todo.dart';
import 'package:clean_arc/usecases/models/todo_mapper.dart';
import 'package:clean_arc/usecases/models/todo_response_model.dart';
import 'package:clean_arc/usecases/ports/i_todo_controller.dart';
import 'package:clean_arc/usecases/ports/i_todo_gateway.dart';
import 'package:clean_arc/usecases/ports/i_todo_presenter.dart';
import 'package:clean_arc/usecases/ports/it_todo_security.dart';
import 'package:clean_arc/usecases/ports/todo_id_generator.dart';

import 'models/todo_request_model.dart';

class TodoUsecase implements ITodoController {
  final ITodoPresenter presenter;
  final ITodoGateway gateway;
  final TodoIDGenerator idGenerator;
  final ITodoSecurity security;
  TodoUsecase({
    required this.presenter,
    required this.gateway,
    required this.idGenerator,
    required this.security,
  });
  @override
  ResponseModel fetchTodos() {
    var result = gateway.getTodos();
    var todos = result.map((e) => TodoMapper.fromJson(e)).toList();
    ResponseModel responseModel = ResponseModel(todos: todos);
    return presenter.displayTodos(responseModel);
  }

  @override
  ResponseModel saveTodo(TodoRequestModel requestModel) {
    var todo = Todo(id: idGenerator.generateID(), title: requestModel.title);
    if (todo.isIdValid() == false) {
      var respModel = ResponseModel(message: "Id is invalid");
      return presenter.showError(respModel);
    } else if (todo.isTitleValid() == false) {
      var respModel = ResponseModel(message: "Title is invalid");
      return presenter.showError(respModel);
    } else if (security.isSecure(requestModel.title) == false) {
      return presenter
          .showError(ResponseModel(message: "You cannot use profanity word"));
    }
    var respModel = ResponseModel(message: "Sucessfully Saved");
    gateway.cacheTodo(TodoMapper.toJson(todo));
    return presenter.showSucess(respModel);
  }
}
