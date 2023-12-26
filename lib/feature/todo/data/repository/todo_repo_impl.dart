import 'package:todo_app/core/exports/export_packages.dart';
import 'package:todo_app/feature/todo/export/todo_export.dart';

class TodoRepoImpl extends TodoRepo {
  TodoRepoImpl(this._files);
  final Files _files;
  late final String path = 'todos.json';

  @override
  Future<void> addTodo(Todo todo) async {
    final todos = await loadTodos();

    List<Todo> newTodos = [...todos.values, todo];

    await _files.write(path, jsonEncode(Todos(values: newTodos)));
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todos = await loadTodos();

    final newTodos = todos.values.where((todo) => todo.id != id).toList();

    await _files.write(path, jsonEncode(Todos(values: newTodos)));
  }

  @override
  Future<Todo?> getTodo(String id) async {
    final todos = await loadTodos();

    // Search the todo by id
    return todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<Todos> loadTodos() async {
    final content = await _files.read(path);
    if (content == null) return const Todos(values: []);
    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();

    final ifExist =
        todos.values.firstWhereOrNull((element) => element.id == todo.id);
    if (ifExist == null) {
      final newTodos = [...todos.values, todo];
      await _files.write(path, jsonEncode(Todos(values: newTodos)));
    } else {
      Todo newTodo = todo.copyWith(
        id: ifExist.id,
        title: ifExist.title,
        description: ifExist.description,
        completed: ifExist.completed,
      );

      final newTodos = todos.values.map((e) {
        return e.id == todo.id ? newTodo : e;
      }).toList();

      await _files.write(path, jsonEncode(Todos(values: newTodos)));
    }
  }

  @override
  Future<void> deleteAllTodo() async {
    _files.delete(path);
  }
}
