import 'package:marvel_comics/comics/data/network/comics_service.dart';
import 'package:marvel_comics/core/data/data_result.dart';

import 'comic_data_wrapper.dart';

abstract class ComicsRemoteDataSource {
  Future<DataResult<List<Comic>>> getComics();
}

class ComicsRemoteDataSourceImpl implements ComicsRemoteDataSource {
  final ComicsService _comicsService;

  ComicsRemoteDataSourceImpl(this._comicsService);

  @override
  Future<DataResult<List<Comic>>> getComics() {
    return _comicsService.getComics().then((value) {
      if (value.isSuccessful && value.body?.status == 'Ok') {
        return Success(value.body?.data.results ?? List.empty());
      } else if (value.isSuccessful) {
        return Failed('${value.body?.data.results.toString()}');
      } else {
        return Failed('${value.error}');
      }
    });
  }
}
