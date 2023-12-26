import 'package:todo_app/feature/todo/data/model/todo_model.dart';

abstract class SaveTodoUseCase {
  Future<void> execute(Todo todo);
}
