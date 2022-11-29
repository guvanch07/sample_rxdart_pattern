import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart_pattern/data/repository/get_university_impl.dart';
import 'package:rxdart_pattern/data/services/api/api_manager.dart';
import 'package:rxdart_pattern/data/services/api/header_service.dart';
import 'package:rxdart_pattern/domain/repository/university_repository.dart';
import 'package:rxdart_pattern/domain/usecase/get_univercity_usecase.dart';
import 'package:rxdart_pattern/presentation/pages/counter/view_model.dart';
import 'package:rxdart_pattern/presentation/pages/univercity/bloc/cubit/get_univercity_cubit.dart';

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
  sl.registerLazySingleton<IUniversityRepository>(
    () => UniversityRepository(
      sl.get<APIManager>(),
    ),
  );
  sl.registerFactory<GetUnivercityUseCase>(
    () => GetUnivercityUseCase(
      sl.get<IUniversityRepository>(),
    ),
  );

  sl.registerFactory<GetUnivercityCubit>(
    () => GetUnivercityCubit(
      sl.get<GetUnivercityUseCase>(),
    ),
  );
}
