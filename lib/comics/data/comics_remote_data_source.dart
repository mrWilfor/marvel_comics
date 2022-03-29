import 'package:chopper/chopper.dart';
import 'package:marvel_comics/comics/data/network/comics_service.dart';

import 'comic_data_wrapper.dart';

abstract class ComicsRemoteDataSource {
  Future<Response<ComicDataWrapper>> getComics();
}

class ComicsRemoteDataSourceImpl implements ComicsRemoteDataSource {
  final ComicsService _comicsService;


  ComicsRemoteDataSourceImpl(this._comicsService);

  @override
  Future<Response<ComicDataWrapper>> getComics() async {
    return _comicsService.getComics();
  }
}
