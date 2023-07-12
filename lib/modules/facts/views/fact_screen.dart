import 'dart:convert';
import 'dart:math';

import 'package:final_project/modules/facts/models/catfactapimodel.dart';
import 'package:final_project/modules/facts/models/dogfactapimodel.dart';
import 'package:final_project/modules/facts/models/factmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/catimageapimodel.dart';
import '../models/dogimageapimodel.dart';
import 'components/facts_list_cell.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var facts = <FactModel>[];
  var catFacts = <CatFactApiModel>[];
  var dogFacts = <DogFactApiModel>[];
  var catImages = <CatImageApiModel>[];
  var dogImages = <DogImageApiModel>[];
  var error = '';

  @override
  void initState() {
    super.initState();
    fetchFacts(Options.all);
  }

  Future<void> _showSnackBar() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          error.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (error.isNotEmpty) {
      _showSnackBar();
    }

    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(1000),
                          elevation: 4,
                          child: ListTile(
                            selected: true,
                            selectedColor: Colors.black,
                            onTap: (() =>
                            {
                              fetchFacts(Options.all),
                            }),
                            title: const Text(
                              'All',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        )),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(1000),
                          elevation: 4,
                          child: ListTile(
                            onTap: (() =>
                            {
                              fetchFacts(Options.cats),
                            }),
                            title: const Text(
                              'Cats',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        )),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(1000),
                          elevation: 4,
                          child: ListTile(
                            onTap: (() => {fetchFacts(Options.dogs)}),
                            title: const Text(
                              'Dogs',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              facts.isNotEmpty
                  ? Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: facts.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final fact = facts[index];
                    return FactsListCell(
                      factModel: fact,
                    );
                  },
                ),
              )
                  : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> fetchFacts(Options option) async {
    _clearFacts();
    switch (option) {
      case Options.all:
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
    setState(() {});
  }

  void _clearFacts() {
    facts.clear();
    catFacts.clear();
    catImages.clear();
    dogFacts.clear();
    dogImages.clear();
    setState(() {});
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
      this.error = error.toString();
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
      this.error = error.toString();
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
      this.error = error.toString();
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
      this.error = error.toString();
    }
  }

  Future<void> _createFacts(Options option) async {
    var size = 0;
    if (catFacts.isNotEmpty) {
      size = catFacts.length;
    } else {
      size = dogFacts.length;
    }
    for (int i = 0; i < size; i++) {
      switch (option) {
        case Options.all:
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
  }
}

enum Options { all, cats, dogs }
