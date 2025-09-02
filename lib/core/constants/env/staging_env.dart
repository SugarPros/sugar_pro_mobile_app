import 'package:envied/envied.dart';
import 'package:sugar_pros/core/constants/env/app_env.dart';
import 'package:sugar_pros/core/constants/env/env_fields.dart';

part 'staging_env.g.dart';

@Envied(name: 'Env', path: 'env/staging.env')
final class StagingEnv implements AppEnv, EnvFields {
  StagingEnv();

  @override
  @EnviedField(varName: 'APP_NAME')
  final String appName = _Env.appName;

  @override
  @EnviedField(varName: 'APP_DEBUG')
  final String appDebug = _Env.appDebug;

  @override
  @EnviedField(varName: 'API')
  final String api = _Env.api;
}
