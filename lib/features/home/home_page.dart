import 'package:dev_manager/features/brew/ui/brew_page.dart';
import 'package:flutter/material.dart';

import '../brew/bloc/brew_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BrewBloc brewBloc = BrewBloc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 40,
        actions: [
          IconButton(
            onPressed: () {
              brewBloc.add(BrewRefreshEvent());
            },
            icon: const Icon(Icons.refresh),
            color: Colors.white,
          )
        ],
      ),
      body: const BrewPage(),
    );
  }
}
