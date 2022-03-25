import 'package:chopper/chopper.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:marvel_comics/comics/data/comics_service.dart';

import '../network/json_serializable_converter.dart';
import 'comic_data_wrapper.dart';

abstract class ComicsRemoteDataSource {
  Future<Response<ComicDataWrapper>> getComics();
}

class ComicsRemoteDataSourceImpl implements ComicsRemoteDataSource {
  @override
  Future<Response<ComicDataWrapper>> getComics() async {
    String publicKey = "e3d418efe1a749744e51b887d20a2c65";
    String privateKey = "44dd784f0df72f5a5aeb61d074671888e740955f";
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String hash = crypto.md5
        .convert(utf8.encode('$timestamp$privateKey$publicKey'))
        .toString();

    final chopper = ChopperClient(
        baseUrl: 'https://gateway.marvel.com:443',
        services: [
          ComicsService.create(),
        ],
        converter: const JsonToTypeConverter(
            {ComicDataWrapper: ComicDataWrapper.fromJson}));
    var comicsService = chopper.getService<ComicsService>();

    return comicsService.getComics(timestamp, publicKey, hash);
  }
}
