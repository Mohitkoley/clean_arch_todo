import 'package:todo_app/core/exports/export_packages.dart';

extension ContextX on BuildContext {
  void showSnack(String message) => ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          content: Text(message),
        ),
      );

  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}
