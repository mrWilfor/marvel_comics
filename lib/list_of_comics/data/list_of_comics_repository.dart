import 'list_of_comics_remote_data_source.dart';
import 'list_of_comics_response.dart';

abstract class ListOfComicsRepository {
  Future<ListOfComicsResponse> getComics();
}

class ListOfComicsRepositoryImpl implements ListOfComicsRepository {
  final ListOfComicsRemoteDataSource listOfComicsRemoteDataSource;

  ListOfComicsRepositoryImpl({ required this.listOfComicsRemoteDataSource});

  @override
  Future<ListOfComicsResponse> getComics() {
    return listOfComicsRemoteDataSource.getComics();
  }
}