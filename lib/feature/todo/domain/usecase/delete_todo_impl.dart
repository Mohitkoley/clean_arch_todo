import 'package:todo_app/feature/todo/domain/repository/todo_repo.dart';
import 'delete_todo.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  DeleteTodoUseCaseImpl(this.todosRepository);
  final TodoRepo todosRepository;

  @override
  Future<void> execute(String id) async {
    await todosRepository.deleteTodo(id);
  }
}
