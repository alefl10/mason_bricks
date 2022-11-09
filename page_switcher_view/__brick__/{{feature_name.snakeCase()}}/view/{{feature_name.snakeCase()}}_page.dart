import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{app_name.snakeCase()}}/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}.dart';

class {{feature_name.pascalCase()}}Page extends StatelessWidget {
  const {{feature_name.pascalCase()}}Page({super.key});

  static String path = '{{feature_name.snakeCase()}}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => {{feature_name.pascalCase()}}Bloc()..add({{feature_name.pascalCase()}}DataRequested()),
        child: const {{feature_name.pascalCase()}}Switcher(),
      ),
    );
  }
}
