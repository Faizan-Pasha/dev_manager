import 'package:flutter/material.dart';
import 'package:dev_manager/features/brew/bloc/brew_bloc.dart';

import '../models/brew_model.dart';

class BrewTileWidget extends StatelessWidget {
  final BrewModel data;
  final BrewBloc brewBloc;
  const BrewTileWidget({super.key, required this.data, required this.brewBloc});

  @override
  Widget build(BuildContext context) {
    var iconButton = IconButton(
      onPressed: () {
        brewBloc.add(BrewStopServiceClickedEvent(brew: data));
      },
      icon: const Icon(Icons.stop),
      color: Colors.red,
    );
    return ListTile(
        title: Text(data.name),
        trailing: Container(
          child: data.status.loading
              ? const SizedBox(
                  child: CircularProgressIndicator(),
                )
              : data.status.status
                  ? iconButton
                  : IconButton(
                      onPressed: () {
                        brewBloc.add(BrewStartServiceClickedEvent(brew: data));
                      },
                      icon: const Icon(Icons.play_arrow),
                      color: Colors.green,
                    ),
        ));
  }
}
