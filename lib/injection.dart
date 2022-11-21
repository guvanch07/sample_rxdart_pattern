import 'package:get_it/get_it.dart';
import 'package:rxdart_pattern/view_model.dart';

Future<void> injectPresentationModule(GetIt sl) async {
  sl.registerFactory<AllLeaguesBloc>(
    () => AllLeaguesBloc(),
  );
}
