import 'package:rxdart/rxdart.dart';
import 'package:rxdart_pattern/base_bloc.dart';

abstract class AllLeaguesBloc extends BaseBloc {
  factory AllLeaguesBloc() => _AllLeaguesBloc();
  void Function(int count) get addResponse;
  Stream<int> get getResponse;
}

class _AllLeaguesBloc implements AllLeaguesBloc {
  @override
  void dispose() {}

  @override
  void initState() {}

  final _data = BehaviorSubject<int>();

  @override
  void Function(int count) get addResponse => _data.sink.add;

  @override
  Stream<int> get getResponse => _data.stream;
}
