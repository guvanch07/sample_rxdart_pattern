import 'package:rxdart/rxdart.dart';
import 'package:rxdart_pattern/presentation/core/base_bloc.dart';

abstract class AllLeaguesBloc extends BaseBloc {
  factory AllLeaguesBloc() => _AllLeaguesBloc();
  void Function(int count) get addResponse;
  Stream<int> get getResponse;
  void Function(bool count) get addChangeResponse;
  Stream<bool> get getChangedResponse;
}

class _AllLeaguesBloc implements AllLeaguesBloc {
  @override
  void dispose() {}

  @override
  void initState() {}

  final _data = BehaviorSubject<int>();
  final _color = BehaviorSubject<bool>();

  @override
  void Function(int count) get addResponse => _data.sink.add;

  @override
  Stream<int> get getResponse => _data.stream;

  @override
  void Function(bool count) get addChangeResponse => _color.sink.add;

  @override
  Stream<bool> get getChangedResponse => _color.stream;
}
