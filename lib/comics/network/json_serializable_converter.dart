import 'package:chopper/chopper.dart';

import 'json_type_parser.dart';

class JsonToTypeConverter extends JsonConverter {
  final Map<Type, JsonFactory> factories;

  const JsonToTypeConverter(this.factories);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<BodyType>(
        body: decode<InnerType>(jsonRes.body));
  }

  @override
  Response convertError<BodyType, InnerType>(Response response) {
    final jsonRes = super.convertError(response);
    final responseError = decode<String>(jsonRes.body);
    return jsonRes.copyWith(bodyError: responseError);
  }

  dynamic decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity);
    if (entity is Map<String, dynamic>) return _decodeMap<T>(entity);

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      throw Exception(T.toString());
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) => values
      .where((element) => element != null)
      .map((e) => decode<T>(e))
      .toList() as List<T>;
}
