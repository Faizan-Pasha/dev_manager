import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../module/models/application_model.dart';
import '../module/provider/mongodb.dart';
import '../widgets/application_list_widget.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(mongodbStateProvider.notifier).initialize();
    return Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: ApplicationListWidget(
            applicationData: ApplicationModel(
              name: 'MongoDB',
              status: mongodbStateProvider,
              start: mongodbStartProvider,
              stop: mongodbStopProvider,
            ),
          ),
        ));
  }
}
