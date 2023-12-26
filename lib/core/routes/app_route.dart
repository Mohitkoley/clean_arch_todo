import 'package:todo_app/core/exports/export.dart';

GoRouter get router => _router;

GoRouter _router = GoRouter(
  initialLocation: RouteNames.todo,
  routes: [
    GoRoute(
      path: RouteNames.home,
      name: RouteNames.home,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
        path: RouteNames.todo,
        name: RouteNames.todo,
        builder: (context, state) => const TodoListScreen(),
        routes: [
          GoRoute(
            path: RouteNames.newTodo,
            name: RouteNames.newTodo,
            builder: (context, state) => EditTodoScreen(),
          ),
          GoRoute(
            path: RouteNames.id,
            name: RouteNames.id,
            builder: (context, state) =>
                EditTodoScreen(todoId: state.pathParameters[['id']]),
          ),
        ])
  ],
);
