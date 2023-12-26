import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/feature/todo/data/module/todo_repo_impl_module.dart';

import 'delete_todo.dart';
import 'delete_todo_impl.dart';
import 'get_todo.dart';
import 'get_todo_impl.dart';
import 'get_todos.dart';
import 'get_todos_impl.dart';
import 'save_todo.dart';
import 'save_todo_impl.dart';

final getTodosProvider = Provider<GetTodosUseCase>((ref) {
  return GetTodosUseCaseImpl(ref.read(todoRepoProvider));
});

final getTodoProvider = Provider<GetTodoUseCase>((ref) {
  return GetTodoUseCaseImpl(ref.read(todoRepoProvider));
});

final saveTodoProvider = Provider<SaveTodoUseCase>((ref) {
  return SaveTodoUseCaseImpl(ref.read(todoRepoProvider));
});

final deleteTodoProvider = Provider<DeleteTodoUseCase>((ref) {
  return DeleteTodoUseCaseImpl(ref.read(todoRepoProvider));
});
