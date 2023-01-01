/*
 * Created on Sun Jan 01 2023
 *
 * The MIT License (MIT)
 * Copyright (c) 2023 Jonathan Monga jmonga98@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software
 * and associated documentation files (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial
 * portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 * TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mpesa4dart/src/constants/keys.dart';
import 'package:mpesa4dart/src/models/model_interface.dart';
import 'package:mpesa4dart/src/models/serializers.dart';

part 'session_response.g.dart';

abstract class SessionResponse
    with ModelInterface
    implements Built<SessionResponse, SessionResponseBuilder> {
  SessionResponse._();
  factory SessionResponse([void Function(SessionResponseBuilder) updates]) =
      _$SessionResponse;

  @BuiltValueField(wireName: Keys.OutputResponseCode)
  String get outputResponseCode;

  @BuiltValueField(wireName: Keys.OutputResponseDesc)
  String get outputResponseDesc;

  @BuiltValueField(wireName: Keys.OutputSessionID)
  String get outputSessionID;

  @override
  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SessionResponse.serializer, this)
        as Map<String, dynamic>;
  }

  static SessionResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SessionResponse.serializer, json);
  }

  static Serializer<SessionResponse> get serializer =>
      _$sessionResponseSerializer;
}
