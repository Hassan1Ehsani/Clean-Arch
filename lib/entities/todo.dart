class Todo {
  final String? id;
  final String? title;
  Todo({this.id, this.title});

  bool isIdValid() {
    if (id == null) return false;
    if (id!.length < 4) return false;
    return true;
  }

  bool isTitleValid() {
    if (title == null) return false;
    if (title!.length < 10) return false;
    return true;
  }
}
