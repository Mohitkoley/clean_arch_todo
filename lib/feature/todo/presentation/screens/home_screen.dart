import 'package:todo_app/core/exports/export_feature.dart';
import 'package:todo_app/core/exports/export_packages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
      ),
      body: Container(),
    );
  }
}
