part of 'brew_bloc.dart';


abstract class BrewState {
  List<BrewModel> brews;
  BrewState({required this.brews});
}

abstract class BrewActionState extends BrewState {
  BrewActionState({required super.brews});
}

final class BrewInitial extends BrewState {
  BrewInitial({required List<BrewModel> brews}) : super(brews: brews);
}

final class BrewLoadingState extends BrewState {
  BrewLoadingState({required super.brews});
}

final class BrewLoadedState extends BrewState {
  BrewLoadedState({required super.brews});

}

// loading state for specific item based on the index
class BrewItemLoadingState extends BrewState {
  final BrewModel brew;

  BrewItemLoadingState({required this.brew, required super.brews});
}

class BrewErrorState extends BrewState {
  BrewErrorState({required super.brews});
}

class BrewStartActionState extends BrewActionState {
  BrewStartActionState({required super.brews});
}

class BrewStopActionState extends BrewActionState {
  BrewStopActionState({required super.brews});
}
