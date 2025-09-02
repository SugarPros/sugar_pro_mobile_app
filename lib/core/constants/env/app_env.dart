import 'package:flutter/foundation.dart';
import 'package:sugar_pros/core/constants/env/dev_env.dart';
import 'package:sugar_pros/core/constants/env/env_fields.dart';
import 'package:sugar_pros/core/constants/env/prod_env.dart';
import 'package:sugar_pros/core/constants/env/staging_env.dart';

abstract interface class AppEnv implements EnvFields {

  factory AppEnv() => _instance;

  static const String _env = String.fromEnvironment('app.env', defaultValue: kDebugMode ? 'dev' : 'staging');

  static final AppEnv _instance = _env == 'dev' ? DevEnv() : _env == 'staging' ? StagingEnv() : ProdEnv();
}