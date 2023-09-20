import 'package:dev_manager/features/brew/ui/brew_shimmer_widger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/brew_bloc.dart';
import 'brew_tile_widget.dart';

class BrewPage extends StatefulWidget {

  const BrewPage({
    Key? key,
  }) : super(key: key);

  @override
  BrewPageState createState() => BrewPageState();
}

class BrewPageState extends State<BrewPage> {
  @override
  void initState() {
    brewBloc.add(BrewInitialEvent());
    super.initState();
  }

  final BrewBloc brewBloc = BrewBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: brewBloc,
      listenWhen: (previous, current) => current is BrewActionState,
      buildWhen: (previous, current) => current is! BrewActionState,
      listener: (context, state) {
        if (state is BrewStartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Brew Start"),
            ),
          );
        } else if (state is BrewStopActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Brew Stop"),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case BrewInitialEvent:
            return const Center(
              child: BrewShimmerWidget(),
            );
          case BrewLoadedState:
            final successState = state as BrewLoadedState;

            return ListView.builder(
              itemCount: successState.brews.length,
              itemBuilder: (context, index) {
                final data = successState.brews[index];
                return BrewTileWidget(
                  data: data,
                  brewBloc: brewBloc,
                );
              },
            );
          case BrewActionState:
            return const Center(
              child: BrewShimmerWidget(),
            );
          default:
            return const Center(
              child: BrewShimmerWidget(),
            );
        }
      },
    );
  }
}
