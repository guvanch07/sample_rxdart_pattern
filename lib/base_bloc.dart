import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

abstract class BaseBloc<D> {
  void initState();
  void dispose();
}

abstract class BlocState<S extends StatefulWidget, B extends BaseBloc>
    extends State<S> {
  @protected
  final B bloc = GetIt.I.get<B>();
}

abstract class BlocStateless<B extends BaseBloc> extends StatelessWidget {
  BlocStateless({Key? key}) : super(key: key);
  @protected
  final B bloc = GetIt.I.get<B>();
}
