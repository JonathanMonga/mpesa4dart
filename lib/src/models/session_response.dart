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
