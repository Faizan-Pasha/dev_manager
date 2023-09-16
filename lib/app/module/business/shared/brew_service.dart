import 'dart:io';

class Brews {
  Future<Status> getStatus(String serviceName) async {
    try {
      final processResult = await Process.run('brew', ['services', 'list']);
      if (processResult.exitCode == 0) {
        final servicesList = processResult.stdout as String;
        final serviceLine = servicesList
            .split('\n')
            .firstWhere((line) => line.contains(serviceName));

        if (serviceLine.isNotEmpty) {
          final status = serviceLine.split(RegExp(r'\s+'))[1];
          return status == 'started' ? Status.running : Status.stopped;
        } else {
          return Status.error; // Service not found
        }
      } else {
        return Status.error;
      }
    } catch (e) {
      return Status.error;
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

enum Status {
  running,
  stopped,
  error,
}
