import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationBloc extends Cubit {
  ValidationBloc(super.initialState);
  bool _isValidName = false;
  String? _errorName;

  String? get errorName => _errorName;
  bool get isValidName => _isValidName;

  void userNameErrorHandler(String value) {
    if (!value.contains(RegExp(r'^[a-zA-Z]+$'))) {
      emit(_errorName = 'Недопустимые символы');
    } else if (value.length < 3) {
      emit(_isValidName = false);
      emit(_errorName = 'Больше двух букв');
    } else {
      emit(_isValidName = true);
      emit(_errorName = null);
    }
  }
}
