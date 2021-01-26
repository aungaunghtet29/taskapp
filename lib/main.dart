import 'package:flutter/material.dart';
import 'package:key_value_store_flutter/key_value_store_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskapp/src/core/data/services/local-repo.dart';
import 'package:taskapp/src/core/data/services/todo-local-storage.dart';
import 'package:taskapp/src/core/presentation/provider/todo-provider.dart';
import 'package:taskapp/src/feature/general/todo-app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TodoProvider(
    todosRepository: TodoLocalRepo(
      localStorage: LocalStorage(
        key: "todos",
        store: FlutterKeyValueStore(await SharedPreferences.getInstance()),
      ),
    ),
    child: TodoApp(),
  ));
}
