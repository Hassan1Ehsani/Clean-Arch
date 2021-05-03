import 'package:clean_arc/usecases/ports/it_todo_security.dart';

class TodoSecurity implements ITodoSecurity {
  @override
  bool isSecure(String data) {
    if (data.contains("marg")) {
      return false;
    }
    return true;
  }
}
