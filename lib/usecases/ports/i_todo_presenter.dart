import 'package:clean_arc/usecases/models/todo_request_model.dart';


abstract class ITodoPresenter {
  ResponseModel showError(ResponseModel responseModel);
  ResponseModel showSucess(ResponseModel responseModel);
  ResponseModel displayTodos(ResponseModel responseModel);
}
