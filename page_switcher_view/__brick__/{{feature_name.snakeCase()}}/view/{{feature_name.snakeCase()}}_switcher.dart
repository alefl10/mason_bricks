import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{app_name.snakeCase()}}/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}.dart';

class {{feature_name.pascalCase()}}Switcher extends StatelessWidget {
  const {{feature_name.pascalCase()}}Switcher({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      ({{feature_name.pascalCase()}}Bloc bloc) => bloc.state.status,
    );
    switch (status) {
      case {{feature_name.pascalCase()}}Status.initial:
      case {{feature_name.pascalCase()}}Status.loading:
        // TODO(you): CREATE CUSTOM LOADING VIEW
        return const Center(child: CircularProgressIndicator());
      case {{feature_name.pascalCase()}}Status.success:
        return const {{feature_name.pascalCase()}}View();
      case {{feature_name.pascalCase()}}Status.error:
        // TODO(you): CREATE CUSTOM ERROR VIEW
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Something went wrong.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<{{feature_name.pascalCase()}}Bloc>().add({{feature_name.pascalCase()}}DataRequested());
                },
                child: const Text('Try again'),
              ),
            ],
          ),
        );
    }
  }
}
