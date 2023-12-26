import 'package:todo_app/core/exports/export.dart';
import 'package:todo_app/core/utils/extension.dart';

class EditTodoScreen extends ConsumerStatefulWidget {
  const EditTodoScreen({super.key, this.todoId});
  final String? todoId;

  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends ConsumerState<EditTodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late SaveTodoUseCase saveTodo = ref.read(saveTodoProvider);
  final isCompletedProvider = StateProvider.autoDispose<bool>((ref) => false);
  final isEdited = StateProvider.autoDispose<bool>((ref) => false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.todoId != null) {
      ref.read(getTodoProvider).execute(widget.todoId!).then((todo) {
        if (todo != null) {
          titleController.text = todo.title;
          if (todo.description != null) {
            descriptionController.text = todo.description!;
          }
          ref.read(isCompletedProvider.notifier).update((state) {
            return todo.completed;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  save() async {
    if (_formKey.currentState!.validate()) {
      final todo = Todo(
        id: widget.todoId ?? shortid.generate(),
        title: titleController.text,
        description: descriptionController.text,
        completed: ref.watch(isCompletedProvider.notifier).state,
      );
      await saveTodo.execute(todo);

      if (context.mounted) {
        context.showSnack('Todo saved');
        GoRouter goRouter = GoRouter.of(context);
        if (goRouter.canPop()) {
          goRouter.pop();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isCompleted = ref.watch(isCompletedProvider.notifier).state;
    return PopScope(
      canPop: true,
      onPopInvoked: (canPop) {
        if (ref.watch(isEdited.notifier).state) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Discard changes?'),
                  content: const Text(
                      'If you go back now, your changes will be lost.'),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        context.pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        GoRouter goRouter = GoRouter.of(context);
                        if (goRouter.canPop()) {
                          goRouter.pop();
                        }
                      },
                      child: const Text('Discard'),
                    ),
                  ],
                );
              });
        } else {
          GoRouter goRouter = GoRouter.of(context);
          if (goRouter.canPop()) {
            goRouter.pop();
          }
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('New Todo'),
          ),
          body: Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: () {
                    ref.read(isEdited.notifier).update((state) => true);
                  },
                  child: Column(children: [
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: 'Enter title',
                        labelText: 'Title',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        hintText: 'Enter description',
                        labelText: 'Description',
                      ),
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CheckboxListTile.adaptive(
                        title: const Text('Completed'),
                        value: isCompleted,
                        onChanged: (value) {
                          ref
                              .read(isCompletedProvider.notifier)
                              .update((state) => value!);
                          if (_formKey.currentState!.validate()) {
                            save();
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                  ])),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              save();
            },
            label: const Text('Save'),
            icon: const Icon(Icons.save),
          )),
    );
  }
}
