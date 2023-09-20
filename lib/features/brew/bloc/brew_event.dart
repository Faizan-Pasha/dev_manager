part of 'brew_bloc.dart';

@immutable
abstract class BrewEvent {}

class BrewInitialEvent extends BrewEvent {}

class BrewRefreshEvent extends BrewEvent {}

class BrewStartServiceClickedEvent extends BrewEvent {
  final BrewModel brew;
  BrewStartServiceClickedEvent({required this.brew});
}

class BrewStopServiceClickedEvent extends BrewEvent {
  final BrewModel brew;
  BrewStopServiceClickedEvent({required this.brew});
}
