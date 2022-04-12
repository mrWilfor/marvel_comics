import 'package:bloc_test/bloc_test.dart';
import 'package:marvel_comics/comics/data/comic_data_wrapper.dart';
import 'package:marvel_comics/comics/data/comics_repository.dart';
import 'package:marvel_comics/comics/domain/ComicsBloc.dart';
import 'package:marvel_comics/core/data/data_result.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'comics_bloc_test.mocks.dart';

@GenerateMocks([ComicsRepository])
void main() {
  var comicsRepository = MockComicsRepository();
  when(comicsRepository.getComics()).thenAnswer((_) => createSuccessResult());

  blocTest(
      'when initState() and result success then state contains DataResult_Success',
      build: () => ComicsBloc(repository: comicsRepository),
      skip: 1,
      act: (ComicsBloc bloc) => bloc.initState(),
      expect: () => [isA<Success<List<Comic>>>()]);
}

Future<DataResult<List<Comic>>> createSuccessResult() {
  return Future.value(Success(List.empty()));
}
