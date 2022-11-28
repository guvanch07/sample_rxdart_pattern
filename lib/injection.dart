import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart_pattern/data/services/api/api_manager.dart';
import 'package:rxdart_pattern/data/services/api/header_service.dart';
import 'package:rxdart_pattern/view_model.dart';

Future<void> injectPresentationModule(GetIt sl) async {
  sl.registerFactory<AllLeaguesBloc>(
    () => AllLeaguesBloc(),
  );

  sl.registerSingleton<http.Client>(
    http.Client(),
  );
  sl.registerSingleton<HeadersService>(
    HeadersService(),
  );

  sl.registerSingleton<APIManager>(
    APIManager(
      client: sl.get<http.Client>(),
      headersService: sl.get<HeadersService>(),
    ),
  );
}
