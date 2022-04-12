import '../../core/data/data_result.dart';
import 'comic_data_wrapper.dart';
import 'comics_remote_data_source.dart';

abstract class ComicsRepository {
  Future<DataResult<List<Comic>>> getComics();
}

class ComicsRepositoryImpl implements ComicsRepository {
  final ComicsRemoteDataSource comicsRemoteDataSource;

  ComicsRepositoryImpl({required this.comicsRemoteDataSource});

  @override
  Future<DataResult<List<Comic>>> getComics() {
    return comicsRemoteDataSource.getComics();
  }
}
