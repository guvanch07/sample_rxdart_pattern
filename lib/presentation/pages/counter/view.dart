import 'package:flutter/material.dart';
import 'package:rxdart_pattern/presentation/core/base_bloc.dart';
import 'package:rxdart_pattern/presentation/pages/counter/view_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends BlocState<MyHomePage, AllLeaguesBloc> {
  int counter = 0;
  bool isChanged = false;

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<bool>(
                stream: bloc.getChangedResponse,
                builder: (context, snapshot) {
                  final isdatachanged = snapshot.data;
                  return Container(
                    color: isdatachanged ?? false ? Colors.amber : Colors.red,
                    width: 200,
                    height: 200,
                  );
                }),
            StreamBuilder<int>(
                initialData: 0,
                stream: bloc.getResponse,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  return Text(
                    '$data',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.addResponse(counter++);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.addChangeResponse(isChanged = !isChanged);
            },
            tooltip: 'isChanged',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
