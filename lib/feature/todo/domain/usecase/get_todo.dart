import 'package:todo_app/feature/todo/data/model/todo_model.dart';

abstract class GetTodoUseCase {
  Future<Todo?> execute(String id);
}
