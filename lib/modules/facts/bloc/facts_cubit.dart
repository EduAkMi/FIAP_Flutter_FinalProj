import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../models/catfactapimodel.dart';
import '../models/catimageapimodel.dart';
import '../models/dogfactapimodel.dart';
import '../models/dogimageapimodel.dart';
import '../models/factmodel.dart';
import 'facts_cubit_state.dart';

enum Options { both, cats, dogs }

class FactsCubit extends Cubit<FactsCubitState> {
  FactsCubit()
      : super(
    const FactsCubitState(
      status: FactsCubitStateStatus.loading,
    ),
  );

  var catFacts = <CatFactApiModel>[];
  var dogFacts = <DogFactApiModel>[];
  var catImages = <CatImageApiModel>[];
  var dogImages = <DogImageApiModel>[];

  void onInit() {
    fetchFacts(Options.both);
  }

  Future<void> fetchFacts(Options option) async {
    _emitLoading();

    _clearFacts();
    switch (option) {
      case Options.both:
        await _fetchCats();
        await _fetchDogs();
        break;
      case Options.cats:
        await _fetchCats();
        break;
      case Options.dogs:
        await _fetchDogs();
        break;
    }
    await _createFacts(option);
  }

  void _emitLoading() {
    emit(
      state.copyWith(
          status: FactsCubitStateStatus.loading,
          onBothPressed: () {
            fetchFacts(Options.both);
          },
          onCatsPressed: () {
            fetchFacts(Options.cats);
          },
          onDogsPressed: () {
            fetchFacts(Options.dogs);
          }),
    );
  }

  void _emitError(String error) {
    emit(
      state.copyWith(
        status: FactsCubitStateStatus.error,
        error: error.toString(),
        onBothPressed: () {
          fetchFacts(Options.both);
        },
        onCatsPressed: () {
          fetchFacts(Options.cats);
        },
        onDogsPressed: () {
          fetchFacts(Options.dogs);
        },
      ),
    );
  }

  void _emitLoaded(List<FactModel> facts) {
    emit(state.copyWith(
      status: FactsCubitStateStatus.loaded,
      facts: facts,
      onBothPressed: () {
        fetchFacts(Options.both);
      },
      onCatsPressed: () {
        fetchFacts(Options.cats);
      },
      onDogsPressed: () {
        fetchFacts(Options.dogs);
      },
    ));
  }

  void _clearFacts() {
    catFacts.clear();
    catImages.clear();
    dogFacts.clear();
    dogImages.clear();
  }

  Future<void> _fetchCats() async {
    await _fetchCatFacts();
    await _fetchCatImages();
  }

  Future<void> _fetchDogs() async {
    await _fetchDogFacts();
    await _fetchDogImages();
  }

  Future<void> _fetchCatFacts() async {
    try {
      var randomPage = Random().nextInt(30);
      final uri = Uri.parse('https://catfact.ninja/facts?limit=5&max_length=140&page=$randomPage');
      final response = await Client().get(uri);

      final responseJson = jsonDecode(response.body);
      final catListJson = responseJson['data'];

      catFacts = catListJson
          .map<CatFactApiModel>((catsJson) => CatFactApiModel.fromJson(catsJson))
          .toList();
    } catch (error) {
      _emitError(error.toString());
    }
  }

  Future<void> _fetchCatImages() async {
    try {
      final uri = Uri.parse('https://api.thecatapi.com/v1/images/search?limit=5');
      final response = await Client().get(uri);

      final responseJson = jsonDecode(response.body);

      catImages.addAll(responseJson
          .map<CatImageApiModel>((dogsJson) => CatImageApiModel.fromJson(dogsJson))
          .toList());
    } catch (error) {
      _emitError(error.toString());
    }
  }

  Future<void> _fetchDogFacts() async {
    try {
      final uri = Uri.parse('https://dogapi.dog/api/v2/facts?limit=5');
      final response = await Client().get(uri);

      final responseJson = jsonDecode(response.body);
      final dogListJson = responseJson['data'];

      dogFacts.addAll(dogListJson
          .map<DogFactApiModel>((dogsJson) => DogFactApiModel.fromJson(dogsJson))
          .toList());
    } catch (error) {
      _emitError(error.toString());
    }
  }

  Future<void> _fetchDogImages() async {
    try {
      final uri = Uri.parse('https://dog.ceo/api/breeds/image/random/5');
      final response = await Client().get(uri);

      final responseJson = jsonDecode(response.body);
      final dogListJson = responseJson['message'];

      dogImages.addAll(dogListJson
          .map<DogImageApiModel>((dogsJson) => DogImageApiModel.fromJson(dogsJson))
          .toList());
    } catch (error) {
      _emitError(error.toString());
    }
  }

  Future<void> _createFacts(Options option) async {
    var size = 0;
    if (catFacts.isNotEmpty) {
      size = catFacts.length;
    } else {
      size = dogFacts.length;
    }
    var facts = <FactModel>[];
    for (int i = 0; i < size; i++) {
      switch (option) {
        case Options.both:
          facts.add(
              FactModel(fact: catFacts[i].fact, image: catImages[i].image, type: FactType.cat));
          facts.add(
              FactModel(fact: dogFacts[i].fact, image: dogImages[i].image, type: FactType.dog));
          break;
        case Options.cats:
          facts.add(
              FactModel(fact: catFacts[i].fact, image: catImages[i].image, type: FactType.cat));
          break;
        case Options.dogs:
          facts.add(
              FactModel(fact: dogFacts[i].fact, image: dogImages[i].image, type: FactType.dog));
          break;
      }
    }
    _emitLoaded(facts);
  }
}

class FactsCubitProvider extends BlocProvider<FactsCubit> {
  FactsCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
    key: key,
    create: (_) =>
    FactsCubit()
      ..onInit(),
    child: child,
  );

  static FactsCubit of(BuildContext context) => BlocProvider.of<FactsCubit>(context);
}
