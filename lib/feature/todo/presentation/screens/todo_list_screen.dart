import 'package:todo_app/core/exports/export.dart';
import 'package:todo_app/feature/todo/presentation/widgets/todo_tile.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosListState);
    final active = todos.active;
    final completed = todos.completed;
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(RouteNames.newTodo);
            },
            icon: const Icon(Icons.add),
            tooltip: 'Add Todo',
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: todos.values.isEmpty
                ? const Center(child: Text('No Todos found'))
                : ListView.builder(
                    itemCount: todos.values.length,
                    itemBuilder: (context, index) {
                      final todo = todos.values[index];
                      return TodoTile(todo: todo);
                    },
                  ),
          ),
          if (completed.isNotEmpty)
            ExpansionTile(
              title: const Text('Completed'),
              children: [
                ...completed.map((todo) => TodoTile(todo: todo)).toList()
              ],
            ),
        ],
      ),
    );
  }
}
