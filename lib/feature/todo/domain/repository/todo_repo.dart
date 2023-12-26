import 'package:todo_app/feature/todo/export/todo_export.dart';

abstract class TodoRepo {
  Future<Todos> loadTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String id);

  Future<void> deleteAllTodo();

  Future<void> addTodo(Todo todo);

  Future<Todo?> getTodo(String id);
}
