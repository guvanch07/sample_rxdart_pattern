import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart_pattern/domain/models/country_data_model.dart';
import 'package:rxdart_pattern/domain/usecase/get_univercity_usecase.dart';
import 'package:url_launcher/url_launcher.dart';

part 'get_univercity_state.dart';

class GetUnivercityCubit extends Cubit<GetUnivercityState> {
  GetUnivercityCubit(
    this._getUnivercityUseCase,
  ) : super(GetUnivercityInitial());
  final GetUnivercityUseCase _getUnivercityUseCase;

  Future<void> addResponse(String name) async {
    emit(GetUnivercityLoading());
    try {
      final data = await _getUnivercityUseCase(name);
      emit(GetUnivercityLoaded(countryModel: data));
    } catch (e) {
      emit(GetUnivercityFail());
      log(e.toString());
    }
  }

  void moveToUrl(String path) async {
    final Uri url = Uri.parse(path);
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}
