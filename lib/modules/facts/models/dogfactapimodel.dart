class DogFactApiModel {
  const DogFactApiModel({
    required this.fact,
  });

  factory DogFactApiModel.fromJson(Map<String, dynamic> json) => DogFactApiModel(
    fact: json['attributes']['body'],
  );

  final String fact;
}