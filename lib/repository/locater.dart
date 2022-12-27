import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist/repository/todo_repository.dart';

final GetIt getIt = GetIt.instance;

registeredRepos() {
  getIt.registerSingleton(TodoRepository());
}

Future<void> setUpLocater() async {
  WidgetsFlutterBinding.ensureInitialized();
  registeredRepos();
}
