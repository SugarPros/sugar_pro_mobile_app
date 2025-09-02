import 'package:envied/envied.dart';
import 'package:sugar_pros/core/constants/env/app_env.dart';
import 'package:sugar_pros/core/constants/env/env_fields.dart';

part 'prod_env.g.dart';

@Envied(name: 'Env', path: 'env/prod.env')
final class ProdEnv implements AppEnv, EnvFields {
  ProdEnv();

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
