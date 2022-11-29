import 'package:rxdart_pattern/domain/models/country_data_model.dart';
import 'package:rxdart_pattern/domain/repository/university_repository.dart';
import 'package:rxdart_pattern/domain/usecase/base_usecase.dart';

class GetUnivercityUseCase
    extends UseCaseParams<String, Future<List<CountryModel>>> {
  final IUniversityRepository _repository;
  GetUnivercityUseCase(
    this._repository,
  );
  @override
  Future<List<CountryModel>> call(String params) =>
      _repository.getAllUniversoties(params);

  @override
  void dispose() {}
}
