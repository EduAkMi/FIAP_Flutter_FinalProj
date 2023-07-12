import 'package:final_project/modules/facts/models/factmodel.dart';
import 'package:flutter/material.dart';

class FactsListCell extends StatelessWidget {
  const FactsListCell({
    super.key,
    required this.factModel,
  });

  final FactModel factModel;

  @override
  Widget build(BuildContext context) {
    var leftExpanded = getImageExpanded();
    var rightExpanded = getTextExpanded();
    switch (factModel.type) {
      case FactType.cat:
        leftExpanded = getImageExpanded();
        rightExpanded = getTextExpanded();
        break;
      case FactType.dog:
        leftExpanded = getTextExpanded();
        rightExpanded = getImageExpanded();
        break;
    }

    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 4,
      child: Row(
        children: [
          leftExpanded,
          rightExpanded,
        ],
      ),
    );
  }

  Expanded getTextExpanded() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              factModel.fact,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 8),
            // Text(
            //   'catFact.overview',
            //   maxLines: 3,
            //   overflow: TextOverflow.ellipsis,
            // ),
          ],
        ),
      ),
    );
  }

  Expanded getImageExpanded() {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
        child: Image.network(factModel.image ?? ''),
      ),
    );
  }
}
