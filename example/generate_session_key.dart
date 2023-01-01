// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:mpesa4dart/src/api/session_key.dart';
import 'package:mpesa4dart/src/constants/markets.dart';
import 'package:mpesa4dart/src/mpesa4dart.dart';

void main() async {
  final publicKey = await File('test/public.pem').readAsString();
  final apiKey = await File('test/api_key.pem').readAsString();

  MPesa4Dart.init(
      publicKey: publicKey,
      apiKey: apiKey,
      production: false,
      market: Markets.vodacomDRC);

  var sessionKey = await SessionKey().generate();

  print('outputResponseCode : ${sessionKey.outputResponseCode}');
  print('outputResponseDesc : ${sessionKey.outputResponseDesc}');
  print('outputSessionID : ${sessionKey.outputSessionID}');
}
