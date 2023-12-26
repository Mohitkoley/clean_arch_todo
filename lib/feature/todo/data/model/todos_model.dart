import 'package:todo_app/core/exports/export_packages.dart';
import 'package:todo_app/feature/todo/export/todo_export.dart';

part 'todos_model.g.dart';
part 'todos_model.freezed.dart';

class Todos with _$Todos {
  const factory Todos({
    @Default([]) List<Todo> values,
  }) = _Todos;

  const Todos._();

  List<Todo> get completed {
    return values.where((todo) => todo.completed).toList();
  }

  List<Todo> get active {
    return values.where((todo) => !todo.completed).toList();
  }

  factory Todos.fromJson(Map<String, Object?> json) => _$TodosFromJson(json);
}
