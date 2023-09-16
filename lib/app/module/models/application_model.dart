import 'package:dev_manager/app/module/models/application_list_model.dart';
import 'package:dev_manager/app/module/provider/mongodb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplicationModel {
  String name;
  StateNotifierProvider<dynamic, UpdateStatusModel> status;
  FutureProvider<ApplicationListModel> start;
  FutureProvider<ApplicationListModel> stop;

  ApplicationModel({
    required this.name,
    required this.status,
    required this.start,
    required this.stop,
  });
}
