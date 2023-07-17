import 'package:final_project/modules/facts/views/fact_screen.dart';
import 'package:flutter/material.dart';

import '/modules/facts/models/factmodel.dart';
import '../../../../routes.dart';

class FactsListCell extends StatelessWidget {
  static const int defaultBorderRadius = 10;
  final FactModel factModel;

  const FactsListCell({
    super.key,
    required this.factModel,
  });

  @override
  Widget build(BuildContext context) {
    Expanded leftExpanded;
    Expanded rightExpanded;
    switch (factModel.type) {
      case FactType.cat:
        leftExpanded = getCatImageExpanded();
        rightExpanded = getTextExpanded();
        break;
      case FactType.dog:
        leftExpanded = getTextExpanded();
        rightExpanded = getDogImageExpanded();
        break;
    }

    return Material(
      borderRadius: BorderRadius.circular(defaultBorderRadius.toDouble()),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.fact.name,
              arguments: FactScreenParams(factModel: factModel));
        },
        child: Row(
          children: [
            leftExpanded,
            rightExpanded,
          ],
        ),
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
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded getCatImageExpanded() {
    return getImageExpanded(defaultBorderRadius, 0, defaultBorderRadius, 0);
  }

  Expanded getDogImageExpanded() {
    return getImageExpanded(0, defaultBorderRadius, 0, defaultBorderRadius);
  }

  Expanded getImageExpanded(
    int topLeftRadius,
    int topRightRadius,
    int bottomLeftRadius,
    int bottomRightRadius,
  ) {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius.toDouble()),
          topRight: Radius.circular(topRightRadius.toDouble()),
          bottomLeft: Radius.circular(bottomLeftRadius.toDouble()),
          bottomRight: Radius.circular(bottomRightRadius.toDouble()),
        ),
        child: Image.network(factModel.image ?? ''),
      ),
    );
  }
}
