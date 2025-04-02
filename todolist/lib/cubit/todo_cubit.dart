import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  addTodo(String title) {
    if (title.isEmpty) {
      addError("Title can't be empty");
      return;
    }
    final todo = Todo(name: title, createdAt: DateTime.now());
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    print('TodoCubit - $change');
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }
}
