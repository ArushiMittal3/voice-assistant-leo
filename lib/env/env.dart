
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'geminiApiKey')
  static const String geminiApiKey = _Env.geminiApiKey;
}