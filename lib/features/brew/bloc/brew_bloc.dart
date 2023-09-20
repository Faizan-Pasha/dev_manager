import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../models/brew_model.dart';
import 'brew_service.dart';
part 'brew_event.dart';
part 'brew_state.dart';

class BrewBloc extends Bloc<BrewEvent, BrewState> {
  BrewBloc() : super(BrewInitial(brews: [])) {
    on<BrewInitialEvent>(brewInitialEvent);
    on<BrewStartServiceClickedEvent>(brewStartServiceClickedEvent);
    on<BrewStopServiceClickedEvent>(brewStopServiceClickedEvent);
  }

  FutureOr<void> brewInitialEvent(
      BrewEvent event, Emitter<BrewState> emit) async {
    final brewList = await Brews().getBrews();
    emit(BrewLoadedState(brews: brewList));
  }

  FutureOr<void> brewStartServiceClickedEvent(
      BrewStartServiceClickedEvent event, Emitter<BrewState> emit) async {
    final brew = event.brew;
    final brews = state.brews;
    final index = brews.indexWhere((element) => element.id == brew.id);
    brews[index] = brew.copyWith(status: Status(loading: true, status: false));

    emit(BrewLoadedState(brews: brews));

    await Brews().startService(brew.name);

    final brewList = await Brews().getBrews();
    emit(BrewLoadedState(brews: brewList));
  }

  FutureOr<void> brewStopServiceClickedEvent(
      BrewStopServiceClickedEvent event, Emitter<BrewState> emit) async {
    final brew = event.brew;
    final brews = state.brews;
    final index = brews.indexWhere((element) => element.id == brew.id);
    brews[index] = brew.copyWith(status: Status(loading: true, status: false));

    emit(BrewLoadedState(brews: brews));

    await Brews().stopService(brew.name);

    final brewList = await Brews().getBrews();
    emit(BrewLoadedState(brews: brewList));
  }
}
