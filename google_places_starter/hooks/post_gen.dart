import 'dart:io' show Directory;

import 'package:mason/mason.dart';

Future run(HookContext context) async {
  final logger = context.logger;
  logger.info('\nPopulating Google Places models');
  logger.info(
    'Check out the brick on Brick Hub - '
    'https://brickhub.dev/bricks/google_places_models',
  );

  final brick = Brick.git(
    const GitPath(
      'https://github.com/alefl10/mason_bricks',
      path: 'google_places_models',
    ),
  );
  final generator = await MasonGenerator.fromBrick(brick);
  final newApp = context.vars['app_name'].toString().replaceAll(' ', '_');
  final target = DirectoryGeneratorTarget(Directory(
    '${Directory.current.path}/$newApp',
  ));
  await generator.generate(target);
  logger.info('\nAll done!');
}
