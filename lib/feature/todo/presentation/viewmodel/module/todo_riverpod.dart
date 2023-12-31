import 'package:todo_app/core/exports/export.dart';

// @riverpod
// Future<Todos> getTodosList(GetTodosListRef ref) async {
//   final usecase = ref.read(getTodosProvider);
//   final item = await usecase.execute();
//   return item;
// }

class TodosStateNotifier extends StateNotifier<Todos> {
  TodosStateNotifier(this.ref) : super(const Todos(values: [])) {
    loadTodos();
  }

  final Ref ref;
  late final getTodos = ref.read(getTodosProvider);

  Future<void> loadTodos() async {
    state = await getTodos.execute();
  }

  Future<void> save(Todo todo) async {
    await ref.read(saveTodoProvider).execute(todo);
    await loadTodos();
  }

  Future<Todo?> get(String id) async {
    return await ref.read(getTodoProvider).execute(id);
  }

  Future<void> delete(String id) async {
    await ref.read(deleteTodoProvider).execute(id);
    await loadTodos();
  }
}

final todosListState = StateNotifierProvider<TodosStateNotifier, Todos>(
  (ref) => TodosStateNotifier(ref),
);

final todosListModel = Provider<TodosStateNotifier>((ref) {
  return ref.watch(todosListState.notifier);
});
