class FactModel {
  const FactModel({
    required this.fact,
    required this.image,
    required this.type
  });

  final String fact;
  final String image;
  final FactType type;
}
enum FactType { cat, dog }
