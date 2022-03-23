import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;


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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var comics = getComics();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: comics,
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) => Center(
          child: Text("${snapshot.data?["copyright"]}"),
        ),
      )
    );
  }


  Future<Map<String, dynamic>> getComics() async {
    String publicKey = "e3d418efe1a749744e51b887d20a2c65";
    String privateKey = "44dd784f0df72f5a5aeb61d074671888e740955f";
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String hash = crypto.md5.convert(utf8.encode('$timestamp$privateKey$publicKey')).toString();

    var client = http.Client();
    var response = await client.get(
      Uri.https('gateway.marvel.com:443', 'v1/public/comics', {'ts':'$timestamp', 'apikey': publicKey, 'hash':hash}),);
    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}
