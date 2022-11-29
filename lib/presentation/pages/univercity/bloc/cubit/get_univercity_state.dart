part of 'get_univercity_cubit.dart';

abstract class GetUnivercityState extends Equatable {
  const GetUnivercityState();

  @override
  List<Object> get props => [];
}

class GetUnivercityInitial extends GetUnivercityState {}

class GetUnivercityLoading extends GetUnivercityState {}

class GetUnivercityLoaded extends GetUnivercityState {
  final List<CountryModel> countryModel;
  const GetUnivercityLoaded({
    required this.countryModel,
  });
}

class GetUnivercityFail extends GetUnivercityState {}
