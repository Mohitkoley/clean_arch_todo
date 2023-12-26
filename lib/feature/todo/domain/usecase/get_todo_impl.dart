import 'package:todo_app/feature/todo/data/model/todo_model.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repo.dart';
import 'get_todo.dart';

class GetTodoUseCaseImpl extends GetTodoUseCase {
  GetTodoUseCaseImpl(this.todosRepository);
  final TodoRepo todosRepository;

  @override
  Future<Todo?> execute(String id) => todosRepository.getTodo(id);
}
