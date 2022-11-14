# Page Switcher View

A brick to create the directory structure and boilerplate to implement a feature leveraging the page-switcher-view pattern.

For more information on this pattern check out this [blog](https://medium.com/@alejandroferrero/d045408f872c).

Note: This brick uses Super Initializers for view widgets. Therefore, make sure you're using dart 2.17 on your end.

## 💻 How to use

```
mason make page_switcher_view --app_name "cool app" --feature_name whatever
```

## 🎲 Variables

| Variable           | Description                                                     |
| ------------------ | --------------------------------------------------------------- |
| `app_name`         | Name of the app including the new feature.                      |
| `feature_name`     | Name of the new feature implementing the Page-Switcher-Pattern  |

## ✅ Outputs

### Directory Structure

```
├── whatever
│   ├── bloc
│   │   ├── whatever_bloc.dart
│   │   ├── whatever_event.dart
│   │   └── whatever_state.dart
│   ├── view
|   |   ├── view.dart
│   │   ├── whatever_page.dart
│   │   ├── whatever_switcher.dart
│   │   └── whatever_view.dart
│   ├── widgets
│   │   └── widgets.dart
│   └── whatever.dart
└── ...
```

### Files Content
whatever_bloc.dart
```dart
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'whatever_event.dart';
part 'whatever_state.dart';

class WhateverBloc extends Bloc<WhateverEvent, WhateverState> {
  WhateverBloc() : super(const WhateverState()) {
    on<WhateverDataRequested>(_dataRequested);
  }

  FutureOr<void> _dataRequested(
    WhateverDataRequested event,
    Emitter<WhateverState> emit,
  ) async {
    emit(state.copyWith(status: WhateverStatus.loading));
    try {
      // TODO(you): INITIAL ASYNC CALL
      emit(state.copyWith(status: WhateverStatus.success));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: WhateverStatus.error));
    }
  }
}
```

whatever_event.dart
```dart
part of 'whatever_bloc.dart';

abstract class WhateverEvent extends Equatable {
  const WhateverEvent();

  @override
  List<Object> get props => [];
}

class WhateverDataRequested extends WhateverEvent {}
```

whatever_state.dart
```dart
part of 'whatever_bloc.dart';

enum WhateverStatus { initial, loading, success, error }

class WhateverState extends Equatable {
  const WhateverState({this.status = WhateverStatus.initial});

  final WhateverStatus status;

  @override
  List<Object> get props => [status];

  WhateverState copyWith({
    WhateverStatus? status,
  }) {
    return WhateverState(
      status: status ?? this.status,
    );
  }
}
```

view.dart
```dart
export 'whatever_page.dart';
export 'whatever_switcher.dart';
export 'whatever_view.dart';
```

whatever_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cool_app/whatever/whatever.dart';

class WhateverPage extends StatelessWidget {
  const WhateverPage({super.key});

  static String path = 'whatever';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WhateverBloc()..add(WhateverDataRequested()),
        child: const WhateverSwitcher(),
      ),
    );
  }
}
```

whatever_switcher.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cool_app/whatever/whatever.dart';

class WhateverSwitcher extends StatelessWidget {
  const WhateverSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (WhateverBloc bloc) => bloc.state.status,
    );
    switch (status) {
      case WhateverStatus.initial:
      case WhateverStatus.loading:
        // TODO(you): CREATE CUSTOM LOADING VIEW
        return const Center(child: CircularProgressIndicator());
      case WhateverStatus.success:
        return const WhateverView();
      case WhateverStatus.error:
        // TODO(you): CREATE CUSTOM ERROR VIEW
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Something went wrong.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<WhateverBloc>().add(WhateverDataRequested());
                },
                child: const Text('Try again'),
              ),
            ],
          ),
        );
    }
  }
}
```

whatever_success.dart
```dart
import 'package:flutter/material.dart';

class WhateverView extends StatelessWidget {
  const WhateverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Success'),
    );
  }
}
```

widgets.dart
```dart
export 'bloc/whatever_bloc.dart';
export 'view/view.dart';
export 'widgets/widgets.dart';
```