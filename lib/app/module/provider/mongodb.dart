// Check MongoDB status
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../business/mongodb.dart';
import '../models/application_list_model.dart';

final mongodbStartProvider = FutureProvider<ApplicationListModel>((ref) async {
  return await MongoDBs().startMongoDB().whenComplete(
      () => ref.read(mongodbStateProvider.notifier).updateState());
});

final mongodbStopProvider = FutureProvider<ApplicationListModel>((ref) async {
  return await MongoDBs().stopMongoDB().whenComplete(
      () => ref.read(mongodbStateProvider.notifier).updateState());
});

class MongodbState extends StateNotifier<UpdateStatusModel> {
  MongodbState() : super(const UpdateStatusModel(loading: true, status: false));

  Future<void> initialize() async {
    final status = await MongoDBs().checkMongoDBStatus();
    state = state.copyWith(loading: false, status: status);
  }

  void updateState() async {
    state = state.copyWith(loading: true);
    final status = await MongoDBs().checkMongoDBStatus();
    state = state.copyWith(loading: false, status: status);
  }
}

final mongodbStateProvider =
    StateNotifierProvider<MongodbState, UpdateStatusModel>(
        (ref) => MongodbState());

@immutable
class UpdateStatusModel {
  final bool loading;
  final bool status;

  const UpdateStatusModel({
    required this.loading,
    required this.status,
  });

  UpdateStatusModel copyWith({
    bool? loading,
    bool? status,
  }) {
    return UpdateStatusModel(
      loading: loading ?? this.loading,
      status: status ?? this.status,
    );
  }
}
