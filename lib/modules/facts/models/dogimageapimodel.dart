class DogImageApiModel {
  const DogImageApiModel({
    required this.image,
  });

  factory DogImageApiModel.fromJson(String url) => DogImageApiModel(
        image: url,
      );

  final String image;
}
