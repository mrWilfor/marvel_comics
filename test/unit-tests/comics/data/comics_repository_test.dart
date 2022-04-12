import 'package:marvel_comics/comics/data/comics_remote_data_source.dart';
import 'package:marvel_comics/comics/data/comics_repository.dart';
import 'package:marvel_comics/core/data/data_result.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'comics_repository_test.mocks.dart';

@GenerateMocks([ComicsRemoteDataSource])
void main() {
  var dataSource = MockComicsRemoteDataSource();
  ComicsRepository repository =
      ComicsRepositoryImpl(comicsRemoteDataSource: dataSource);

  test('when getComics() then invoke getComics() of data source', () {
    when(dataSource.getComics())
        .thenAnswer((_) => Future.value(Success(List.empty())));
    repository.getComics();
    verify(dataSource.getComics()).called(1);
  });
}
