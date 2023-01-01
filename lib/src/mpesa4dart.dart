import 'package:meta/meta.dart';
import 'package:mpesa4dart/src/constants/markets.dart';
import 'package:mpesa4dart/src/utils/encryption.dart';
import 'package:mpesa4dart/src/utils/log.dart';
import 'package:mpesa4dart/src/constants/url.dart';

class MPesa4Dart {
  factory MPesa4Dart() => _instance!;

  MPesa4Dart._(
      {required this.encriptedApiKey,
      required this.market,
      required this.production})
      : baseUrl = production! ? Url.prod : Url.sandbox;

  @visibleForTesting
  static void reset() {
    _instance = null;
  }

  static void init({
    required String? publicKey,
    required String? apiKey,
    required bool? production,
    String? market = Markets.vodacomDRC,
    bool? useLogger = false,
    bool? restart = false,
  }) {
    _instance = MPesa4Dart._(
        encriptedApiKey: Encryption(publicKey: publicKey).encrypt(apiKey),
        market: market,
        production: production);
    // Initialize logger
    Log.init(!useLogger!);
  }

  static MPesa4Dart? _instance;

  final String? encriptedApiKey;
  final String? market;
  final bool? production;
  final String? baseUrl;

  @override
  String toString() {
    return '$runtimeType(apiKey: $encriptedApiKey, markets: $market, production: $production, baseUrl: $baseUrl)';
  }
}
