class CatFactApiModel {
  const CatFactApiModel({
    required this.fact,
  });

  factory CatFactApiModel.fromJson(Map<String, dynamic> json) => CatFactApiModel(
    fact: json['fact'],
  );

  final String fact;
}