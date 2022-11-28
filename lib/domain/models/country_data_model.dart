import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  const CountryModel({
    required this.country,
    required this.domains,
    required this.webPages,
    required this.alphaTwoCode,
    required this.name,
    this.stateProvince,
  });

  final String country;
  final List<String> domains;
  final List<String> webPages;
  final String alphaTwoCode;
  final String name;
  final dynamic stateProvince;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        country: json["country"],
        domains: List<String>.from(json["domains"].map((x) => x)),
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        alphaTwoCode: json["alpha_two_code"],
        name: json["name"],
        stateProvince: json["state-province"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "alpha_two_code": alphaTwoCode,
        "name": name,
        "state-province": stateProvince,
      };

  @override
  List<Object?> get props =>
      [country, domains, webPages, alphaTwoCode, name, stateProvince];
}
