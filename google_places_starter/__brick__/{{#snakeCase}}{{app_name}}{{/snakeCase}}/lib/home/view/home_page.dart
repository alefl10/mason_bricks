import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{app_name.snakeCase()}}/l10n/l10n.dart';
import 'package:{{app_name.snakeCase()}}/permission/permission.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PermissionBloc>().add(const PermissionLocationRequested());
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeAppBarTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '${l10n.homeMessage} 🗺',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
