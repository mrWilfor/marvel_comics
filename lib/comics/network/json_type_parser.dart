typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonTypeParser {
  static const Map<Type, JsonFactory> factories = {

  };

  static dynamic decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity);
    if (entity is Map<String, dynamic>) return _decodeMap<T>(entity);

    return entity;
  }

  static T _decodeMap<T>(Map<String, dynamic> values) {
    final JsonFactory = factories[T];
    if (JsonFactory == null || JsonFactory is! JsonFactory<T>) {
      throw JsonFactoryNotFoundException(T.toString());
    }

    return JsonFactory(values);
  }

  static List<T> _decodeList<T>(Iterable values) =>
  values.where((element) => element != null).map((e) => decode<T>(e)).toList() as List<T>;
 }