import 'package:final_project/modules/facts/models/factmodel.dart';
import 'package:flutter/material.dart';

class FactScreenParams {
  final FactModel factModel;

  const FactScreenParams({
    required this.factModel,
  });
}

class FactScreen extends StatelessWidget {
  final FactScreenParams params;

  const FactScreen({
    super.key,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    String appBarTitle;
    switch (params.factModel.type) {
      case FactType.cat:
        appBarTitle = 'Cat fact';
        break;
      case FactType.dog:
        appBarTitle = 'Dog fact';
        break;
    }

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          appBarTitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.network(params.factModel.image),
          const SizedBox(height: 16),
          Text(
            params.factModel.fact,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
