import 'package:process_run/process_run.dart';

import 'shared/brew_service.dart';
import '../models/application_list_model.dart';

class MongoDBs {
  /// Check if MongoDB status from homebrew
  final shell = Shell();
  Future<bool> checkMongoDBStatus() async {
    final result = await Brews().getStatus("mongodb-community");

    switch (result) {
      case Status.running:
        return true;
      case Status.stopped:
        return false;
      case Status.error:
        return false;
    }
  }

  /// Start MongoDB from homebrew
  Future<ApplicationListModel> startMongoDB() async {
    final result = await Brews().startService("mongodb-community");
    if (result) {
      return ApplicationListModel(
        error: false,
        errorMessage: 'MongoDB started successfully.',
        status: true,
      );
    } else {
      return ApplicationListModel(
        error: false,
        errorMessage: 'Failed to start MongoDB.',
        status: false,
      );
    }
  }

  /// Stop MongoDB from homebrew
  Future<ApplicationListModel> stopMongoDB() async {
    final result = await Brews().stopService("mongodb-community");
    if (result) {
      return ApplicationListModel(
        error: false,
        errorMessage: 'MongoDB stopped successfully.',
        status: false,
      );
    } else {
      return ApplicationListModel(
        error: false,
        errorMessage: 'Failed to stop MongoDB.',
        status: false,
      );
    }
  }
}
