import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:marvel_comics/list_of_comics/data/list_of_comics_response.dart';

abstract class ListOfComicsRemoteDataSource {
  Future<ListOfComicsResponse> getComics();
}

class ListOfComicsRemoteDataSourceImpl implements ListOfComicsRemoteDataSource {
  @override
  Future<ListOfComicsResponse> getComics() async {
    String publicKey = "e3d418efe1a749744e51b887d20a2c65";
    String privateKey = "44dd784f0df72f5a5aeb61d074671888e740955f";
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String hash = crypto.md5.convert(utf8.encode('$timestamp$privateKey$publicKey')).toString();

    var client = http.Client();
    var response = await client.get(
      Uri.https('gateway.marvel.com:443', 'v1/public/comics', {'ts':'$timestamp', 'apikey': publicKey, 'hash':hash}),);
    return ListOfComicsResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}