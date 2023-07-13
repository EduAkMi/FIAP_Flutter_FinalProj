import 'package:flutter_bloc/flutter_bloc.dart';

import '/modules/facts/bloc/facts_cubit.dart';
import '/modules/facts/bloc/facts_cubit_state.dart';
import '/modules/facts/views/facts_loading_screen.dart';
import '../views/facts_error_screen.dart';
import '../views/facts_screen.dart';

class FactsContainer extends BlocBuilder<FactsCubit, FactsCubitState> {
  FactsContainer({super.key})
      : super(
          builder: (context, state) {
            switch (state.status) {
              case FactsCubitStateStatus.loading:
                return FactsLoadingScreen(
                  onBothPressed: state.onBothPressed ?? (() {}),
                  onCatsPressed: state.onCatsPressed ?? (() {}),
                  onDogsPressed: state.onDogsPressed ?? (() {}),
                );
              case FactsCubitStateStatus.loaded:
                return FactsScreen(
                  facts: state.facts,
                  onBothPressed: state.onBothPressed ?? (() {}),
                  onCatsPressed: state.onCatsPressed ?? (() {}),
                  onDogsPressed: state.onDogsPressed ?? (() {}),
                );
              case FactsCubitStateStatus.error:
                return FactsErrorScreen(
                  errorMessage: state.error ?? '',
                  onBothPressed: state.onBothPressed ?? (() {}),
                  onCatsPressed: state.onCatsPressed ?? (() {}),
                  onDogsPressed: state.onDogsPressed ?? (() {}),
                );
            }
          },
        );
}
