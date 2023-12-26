import 'package:todo_app/core/exports/export_packages.dart';
import 'package:todo_app/feature/todo/data/model/todo_model.dart';
import 'package:todo_app/feature/todo/presentation/viewmodel/module/todo_riverpod.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(todo.title),
      subtitle: todo.description != null && todo.description!.isNotEmpty
          ? Text(todo.description!)
          : null,
      onTap: () {
        context.push('/todos/${todo.id}');
      },
      trailing: Checkbox(
        value: todo.completed,
        onChanged: (value) {
          if (value != null) {
            final newTodo = todo.copyWith(completed: value);
            ref.read(todosListModel).save(newTodo);
          }
        },
      ),
    );
  }
}
