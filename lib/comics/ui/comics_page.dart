import 'package:flutter/material.dart';
import 'package:marvel_comics/comics/data/comics_remote_data_source.dart';
import 'package:marvel_comics/comics/data/comics_repository.dart';
import 'package:marvel_comics/comics/data/comic_data_wrapper.dart';

class ComicsPage extends StatefulWidget {
  ComicsPage({Key? key}) : super(key: key);
  final ComicsRepository repository = ComicsRepositoryImpl(
      comicsRemoteDataSource: ComicsRemoteDataSourceImpl());

  @override
  _ComicsPageState createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  @override
  Widget build(BuildContext context) {
    Future<ComicDataWrapper> comics = widget.repository.getComics();
    return Center(
        child: FutureBuilder(
            future: comics,
            builder: (BuildContext context,
                AsyncSnapshot<ComicDataWrapper> snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: ListView.builder(
                    itemCount: snapshot.requireData.data.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Center(
                            child: Text(
                                snapshot.requireData.data.results[index].title),
                          ),
                          Center(
                            child: Text(snapshot
                                .requireData.data.results[index].description),
                          )
                        ],
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      )
                    ]);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    )
                  ],
                );
              }
            }));
  }
}
