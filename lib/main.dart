import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart_pattern/injection.dart';
import 'package:rxdart_pattern/presentation/pages/univercity/bloc/cubit/get_univercity_cubit.dart';
import 'package:rxdart_pattern/presentation/pages/univercity/bloc/validation_bloc.dart';
import 'package:rxdart_pattern/presentation/pages/univercity/view/first_screen.dart';

void main() {
  final sl = GetIt.I;
  injectPresentationModule(sl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetUnivercityCubit>(
          create: (context) => GetIt.I.get<GetUnivercityCubit>(),
        ),
        BlocProvider<ValidationBloc>(create: (context) => ValidationBloc(''))
      ],
      child: MaterialApp(
        title: 'Search Univercities',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        home: const FirstPage(),
      ),
    );
  }
}
