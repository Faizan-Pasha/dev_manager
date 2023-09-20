import 'dart:io';

import 'package:dev_manager/features/brew/models/brew_model.dart';

class Brews {
  Future<List<BrewModel>> getBrews() async {
    try {
      final processResult = await Process.run('brew', ['services', 'list']);
      if (processResult.exitCode == 0) {
        final servicesList = processResult.stdout as String;
        final lines = servicesList.split('\n');
        int id = 1;

        // Initialize an empty list to store app information
        final appInfoList = <BrewModel>[];

        // Flag to track whether the line being processed is the first line (header)
        bool isFirstLine = true;
        for (final line in lines) {
          // Debugging statement

          // Skip the first line (header)
          if (isFirstLine) {
            isFirstLine = false;
            continue;
          }

          // Skip empty lines
          if (line.trim().isEmpty) {
            continue;
          }

          final parts = line.split(RegExp(r'\s+'));
          if (parts.length >= 2) {
            // set the status to "none" if the status is not available
            final name = parts[0];
            const status = 'none';
            final user = parts[1];
            const file = '';

            parts.add('$name $status $user $file');
          }

          if (parts.length >= 4) {
            final name = parts[0];
            final status = parts[1] == 'started' ? true : false;
            final user = parts[2];
            final file = parts[3];

            // Consider "none" as not started
            final appInfo = BrewModel(
                id: id++,
                name: name,
                status: Status(status: status, loading: false),
                user: user,
                file: file);
            appInfoList.add(appInfo);
          }
        }

        return appInfoList;
      } else {
        // Handle the case where the 'brew services list' command returns an error
        return [];
      }
    } catch (e) {
      // Handle exceptions
      return [];
    }
  }

  // Start a service
  Future<bool> startService(String serviceName) async {
    try {
      final processResult =
          await Process.run('brew', ['services', 'start', serviceName]);
      if (processResult.exitCode == 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // Stop a service
  Future<bool> stopService(String serviceName) async {
    try {
      final processResult =
          await Process.run('brew', ['services', 'stop', serviceName]);
      if (processResult.exitCode == 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
