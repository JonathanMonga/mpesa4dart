// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SessionResponse> _$sessionResponseSerializer =
    new _$SessionResponseSerializer();

class _$SessionResponseSerializer
    implements StructuredSerializer<SessionResponse> {
  @override
  final Iterable<Type> types = const [SessionResponse, _$SessionResponse];
  @override
  final String wireName = 'SessionResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, SessionResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'output_ResponseCode',
      serializers.serialize(object.outputResponseCode,
          specifiedType: const FullType(String)),
      'output_ResponseDesc',
      serializers.serialize(object.outputResponseDesc,
          specifiedType: const FullType(String)),
      'output_SessionID',
      serializers.serialize(object.outputSessionID,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SessionResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SessionResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'output_ResponseCode':
          result.outputResponseCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'output_ResponseDesc':
          result.outputResponseDesc = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'output_SessionID':
          result.outputSessionID = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SessionResponse extends SessionResponse {
  @override
  final String outputResponseCode;
  @override
  final String outputResponseDesc;
  @override
  final String outputSessionID;

  factory _$SessionResponse([void Function(SessionResponseBuilder)? updates]) =>
      (new SessionResponseBuilder()..update(updates))._build();

  _$SessionResponse._(
      {required this.outputResponseCode,
      required this.outputResponseDesc,
      required this.outputSessionID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        outputResponseCode, r'SessionResponse', 'outputResponseCode');
    BuiltValueNullFieldError.checkNotNull(
        outputResponseDesc, r'SessionResponse', 'outputResponseDesc');
    BuiltValueNullFieldError.checkNotNull(
        outputSessionID, r'SessionResponse', 'outputSessionID');
  }

  @override
  SessionResponse rebuild(void Function(SessionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionResponseBuilder toBuilder() =>
      new SessionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SessionResponse &&
        outputResponseCode == other.outputResponseCode &&
        outputResponseDesc == other.outputResponseDesc &&
        outputSessionID == other.outputSessionID;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, outputResponseCode.hashCode), outputResponseDesc.hashCode),
        outputSessionID.hashCode));
  }
}

class SessionResponseBuilder
    implements Builder<SessionResponse, SessionResponseBuilder> {
  _$SessionResponse? _$v;

  String? _outputResponseCode;
  String? get outputResponseCode => _$this._outputResponseCode;
  set outputResponseCode(String? outputResponseCode) =>
      _$this._outputResponseCode = outputResponseCode;

  String? _outputResponseDesc;
  String? get outputResponseDesc => _$this._outputResponseDesc;
  set outputResponseDesc(String? outputResponseDesc) =>
      _$this._outputResponseDesc = outputResponseDesc;

  String? _outputSessionID;
  String? get outputSessionID => _$this._outputSessionID;
  set outputSessionID(String? outputSessionID) =>
      _$this._outputSessionID = outputSessionID;

  SessionResponseBuilder();

  SessionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _outputResponseCode = $v.outputResponseCode;
      _outputResponseDesc = $v.outputResponseDesc;
      _outputSessionID = $v.outputSessionID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SessionResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SessionResponse;
  }

  @override
  void update(void Function(SessionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SessionResponse build() => _build();

  _$SessionResponse _build() {
    final _$result = _$v ??
        new _$SessionResponse._(
            outputResponseCode: BuiltValueNullFieldError.checkNotNull(
                outputResponseCode, r'SessionResponse', 'outputResponseCode'),
            outputResponseDesc: BuiltValueNullFieldError.checkNotNull(
                outputResponseDesc, r'SessionResponse', 'outputResponseDesc'),
            outputSessionID: BuiltValueNullFieldError.checkNotNull(
                outputSessionID, r'SessionResponse', 'outputSessionID'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
