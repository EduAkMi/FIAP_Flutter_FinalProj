class CatImageApiModel {
  const CatImageApiModel({
    required this.image,
  });

  factory CatImageApiModel.fromJson(Map<String, dynamic> json) => CatImageApiModel(
        image: json['url'],
      );

  final String image;
}
