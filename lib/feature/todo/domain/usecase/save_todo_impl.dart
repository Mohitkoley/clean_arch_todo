import 'package:todo_app/feature/todo/data/model/todo_model.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repo.dart';

import 'save_todo.dart';

class SaveTodoUseCaseImpl extends SaveTodoUseCase {
  SaveTodoUseCaseImpl(this.todosRepository);
  final TodoRepo todosRepository;

  @override
  Future<void> execute(Todo todo) async {
    await todosRepository.saveTodo(todo);
  }
}
