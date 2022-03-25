import 'package:chopper/chopper.dart';

import 'comics_remote_data_source.dart';
import 'comic_data_wrapper.dart';

abstract class ComicsRepository {
  Future<Response<ComicDataWrapper>> getComics();
}

class ComicsRepositoryImpl implements ComicsRepository {
  final ComicsRemoteDataSource comicsRemoteDataSource;

  ComicsRepositoryImpl({ required this.comicsRemoteDataSource});

  @override
  Future<Response<ComicDataWrapper>> getComics() {
    return comicsRemoteDataSource.getComics();
  }
}