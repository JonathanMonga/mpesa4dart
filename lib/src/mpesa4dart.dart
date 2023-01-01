import 'package:meta/meta.dart';
import 'package:mpesa4dart/src/utils/log.dart';
import 'package:mpesa4dart/src/constants/url.dart';

class MPesa4Dart {
  factory MPesa4Dart() => _instance!;

  MPesa4Dart._(
      {required this.publicKey, required this.apiKey, required this.production})
      : baseUrl = production! ? Url.prod : Url.sandbox;

  @visibleForTesting
  static void reset() {
    _instance = null;
  }

  static void init({
    required String? publicKey,
    required String? apiKey,
    required bool? production,
    bool? useLogger = false,
    bool? restart = false,
  }) {
    assert(publicKey != null);
    assert(apiKey != null);
    assert(production != null);
    assert((_instance != null && restart == true) || _instance == null,
        'Are you trying to reset the previous keys by calling MPesa4Dart.init() again?.');
    _instance = MPesa4Dart._(
        publicKey: publicKey, apiKey: apiKey, production: production);
    // Initialize logger
    Log.init(!useLogger!);
  }

  static MPesa4Dart? _instance;

  final String? publicKey;
  final String? apiKey;
  final bool? production;
  final String? baseUrl;

  @override
  String toString() {
    return '$runtimeType(publicKey: $publicKey, apiKey: $apiKey, production: $production, baseUrl: $baseUrl)';
  }
}
