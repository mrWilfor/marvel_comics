import 'package:chopper/chopper.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;

class AuthInterceptor implements RequestInterceptor {
  String publicKey = const String.fromEnvironment('PUBLIC_KEY');
  String privateKey = const String.fromEnvironment('PRIVATE_KEY');

  @override
  Future<Request> onRequest(Request request) async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String hash = crypto.md5
        .convert(utf8.encode('$timestamp$privateKey$publicKey'))
        .toString();

    var parameters = Map.of(request.parameters);

    parameters['ts'] = timestamp;
    parameters['apikey'] = publicKey;
    parameters['hash'] = hash;

    var authRequest = request.copyWith(parameters: parameters);
    authRequest;

    return authRequest;
  }
}
