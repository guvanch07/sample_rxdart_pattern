import 'package:rxdart_pattern/domain/models/country_data_model.dart';

abstract class IUniversityRepository {
  Future<List<CountryModel>> getAllUniversoties(String nameCountry);
}
