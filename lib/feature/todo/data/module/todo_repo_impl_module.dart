import 'package:todo_app/core/exports/export_packages.dart';
import 'package:todo_app/feature/todo/data/datasource/local/module/files_module.dart';

import 'package:todo_app/feature/todo/export/todo_export.dart';

final todoRepoProvider = Provider<TodoRepo>(
    (ref) => TodoRepoImpl(ref.read<Files>(filesImplProvider)));
