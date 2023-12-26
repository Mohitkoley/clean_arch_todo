import 'package:todo_app/feature/todo/data/model/todos_model.dart';

abstract class GetTodosUseCase {
  Future<Todos> execute();
}
