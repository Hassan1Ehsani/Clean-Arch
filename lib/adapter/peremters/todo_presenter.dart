import 'package:clean_arc/usecases/models/todo_request_model.dart';
import 'package:clean_arc/usecases/ports/i_todo_presenter.dart';


class TodoPresenter implements ITodoPresenter {
  @override
  ResponseModel displayTodos(ResponseModel responseModel) {
    print("------------------------");
    print(responseModel.todos);
    print("------------------------");
    return responseModel;
  }

  @override
  ResponseModel showError(ResponseModel responseModel) {
    ResponseModel model = ResponseModel(
      message: "Heehehe You got this error: ${responseModel.message}",
    );
    return model;
  }

  @override
  ResponseModel showSucess(ResponseModel responseModel) {
    ResponseModel model = ResponseModel(
      message: "Hoy Mashallah Success: ${responseModel.message}",
    );
    return model;
  }
}
