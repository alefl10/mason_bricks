import 'package:{{app_name.snakeCase()}}/main/bootstrap.dart';
import 'package:{{app_name.snakeCase()}}/main/configs/configs.dart';
import 'package:{{app_name.snakeCase()}}/main/main_common.dart';

void main() {
  bootstrap(() async => mainCommon(appEnvironment: AppEnvironment.dev));
}
