import 'package:todo_app/core/exports/export.dart';

class TodoAppScreen extends StatelessWidget {
  const TodoAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      routerConfig: router,
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green)),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green)),
      themeMode: ThemeMode.system,
    );
  }
}
