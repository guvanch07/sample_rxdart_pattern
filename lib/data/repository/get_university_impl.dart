import 'package:rxdart_pattern/data/core/end_points.dart';
import 'package:rxdart_pattern/data/services/api/api_manager.dart';
import 'package:rxdart_pattern/domain/models/country_data_model.dart';
import 'package:rxdart_pattern/domain/repository/university_repository.dart';

class UniversityRepository implements IUniversityRepository {
  final APIManager _apiManager;
  UniversityRepository(
    this._apiManager,
  );
  @override
  Future<List<CountryModel>> getAllUniversoties(String nameCountry) async {
    const endpoint = AppEndPoint.baseUrl;
    final url = Uri.parse(endpoint);

    Map<String, dynamic>? query = {'country': nameCountry};
    final result = await _apiManager.getAPICall(
      url: url,
      needAuth: false,
      queryParameters: query,
    );

    final convertToMap = result
        .map<CountryModel>(
          (e) => CountryModel.fromJson(e as Map<String, dynamic>),
        )
        .toList();
    //log('$convertToMap');
    return convertToMap;
  }
}
