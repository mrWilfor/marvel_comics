import 'package:flutter/material.dart';
import 'package:marvel_comics/list_of_comics/data/list_of_comics_remote_data_source.dart';
import 'package:marvel_comics/list_of_comics/data/list_of_comics_repository.dart';
import 'package:marvel_comics/list_of_comics/data/list_of_comics_response.dart';

class ListOfComicsPage extends StatefulWidget {
  ListOfComicsPage({Key? key}) : super(key: key);
  ListOfComicsRepository repository = ListOfComicsRepositoryImpl(listOfComicsRemoteDataSource: ListOfComicsRemoteDataSourceImpl());
  @override
  _ListOfComicsPageState createState() => _ListOfComicsPageState();
}

class _ListOfComicsPageState extends State<ListOfComicsPage> {
  @override
  Widget build(BuildContext context) {
    Future<ListOfComicsResponse> comics = widget.repository.getComics();
    return FutureBuilder(
      future: comics,
      builder: (BuildContext context, AsyncSnapshot<ListOfComicsResponse> snapshot) => Center(
        child: ListView.builder(
          itemCount: snapshot.requireData.data.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: [
                  Center(child: Text(snapshot.requireData.data.results[index].title),),
                  Center(child: Text(snapshot.requireData.data.results[index].description),)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
