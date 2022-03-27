import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_comics/core/data/data_result.dart';

import '../../core/data/data_result.dart';
import '../data/comic_data_wrapper.dart';
import '../data/comics_repository.dart';

abstract class ComicsEvent {}

class GetComicsEvent extends ComicsEvent {}

class ComicsBloc extends Bloc<ComicsEvent, DataResult<List<Comic>>> {
  ComicsBloc({required this.repository}) : super(Loading()) {
    on<GetComicsEvent>((event, emit) => getComics(emit));
  }

  final ComicsRepository repository;

  void getComics(Emitter<DataResult<List<Comic>>> emit) async {
    emit(Loading());
    await repository.getComics().then((value) {
      if (value.isSuccessful) {
        if (value.body?.status == 'Ok') {
          emit(Success(value.body?.data.results ?? List.empty()));
        } else {
          emit(Failed('${value.body?.data.results.toString()}'));
        }
      } else {
        emit(Failed('${value.error}'));
      }
    });
  }

  void initState() {
    add(GetComicsEvent());
  }
}
