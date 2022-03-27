import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_comics/comics/domain/ComicsBloc.dart';

import 'comics/data/comics_remote_data_source.dart';
import 'comics/data/comics_repository.dart';
import 'comics/ui/comics_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ComicsBloc(
            repository: ComicsRepositoryImpl(
                comicsRemoteDataSource: ComicsRemoteDataSourceImpl())),
        child: const ComicsPage(
          title: 'Marvel comics',
        ));
  }
}
