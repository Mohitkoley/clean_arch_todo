import 'package:todo_app/feature/todo/export/todo_export.dart';

import 'get_todos.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  GetTodosUseCaseImpl(this.todosRepository);
  final TodoRepo todosRepository;

  @override
  Future<Todos> execute() => todosRepository.loadTodos();
}
