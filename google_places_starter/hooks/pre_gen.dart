import 'package:mason/mason.dart';

Future run(HookContext context) async {
  final logger = context.logger;

  final hasDevApiKey = logger.confirm(
    'Do you have a Google Maps API key for your Development environment? '
    '(Y/n)',
    defaultValue: false,
  );
  var devApiKey = 'TODO(you): ADD DEV KEY';
  if (hasDevApiKey) {
    devApiKey = logger.prompt(
      'Enter your development Google Maps API key: ',
    );
  }

  var hasStgApiKey = logger.confirm(
    'Do you have a Google Maps API key for your Staging environment? (Y/n)',
    defaultValue: false,
  );
  var stgApiKey = 'TODO(you): ADD STG KEY';
  if (hasStgApiKey) {
    stgApiKey = logger.prompt(
      'Enter your development Google Maps API key: ',
    );
  }

  var hasProdApiKey = logger.confirm(
    'Do you have a Google Maps API key for your Prod environment? (Y/n)',
    defaultValue: false,
  );
  var prodApiKey = 'TODO(you): ADD PROD KEY';

  if (hasProdApiKey) {
    prodApiKey = logger.prompt(
      'Enter your development Google Maps API key: ',
    );
  }

  context.vars = {
    ...context.vars,
    'dev_api_key': devApiKey,
    'stg_api_key': stgApiKey,
    'prod_api_key': prodApiKey,
  };
}
