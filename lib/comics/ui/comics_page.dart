import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_comics/comics/data/comic_data_wrapper.dart';
import 'package:marvel_comics/comics/domain/ComicsBloc.dart';
import 'package:marvel_comics/core/data/data_result.dart';

class ComicsPage extends StatefulWidget {
  const ComicsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ComicsPageState createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  @override
  Widget build(BuildContext context) {
    context.read<ComicsBloc>().initState();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: BlocBuilder<ComicsBloc, DataResult<List<Comic>>>(
                builder: (context, comics) {
                  if (comics is Success) {
                    return createComicsList((comics as Success).data);
                  } else if (comics is Failed) {
                    return createErrorWidget((comics as Failed).message);
                  } else {
                    return createLoadingWidget('Awaiting result...');
                  }
                }
            )));
  }

  Center createComicsList(List<Comic> comics) {
    return Center(
      child: ListView.builder(
        itemCount: comics.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Center(
                child: Text(comics[index].title),
              ),
              Center(
                child: Text(comics[index].description),
              )
            ],
          );
        },
      ),
    );
  }

  Column createLoadingWidget(String loadingInfo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(loadingInfo),
        )
      ],
    );
  }

  Column createErrorWidget(String error) {
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
            child: Text('Error: $error'),
          )
        ]);
  }
}
