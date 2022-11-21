import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart_pattern/injection.dart';
import 'package:rxdart_pattern/view.dart';

void main() {
  final sl = GetIt.I;
  injectPresentationModule(sl);
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
