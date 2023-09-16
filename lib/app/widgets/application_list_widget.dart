import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../module/models/application_model.dart';

class ApplicationListWidget extends ConsumerWidget {
  final ApplicationModel applicationData;
  const ApplicationListWidget({
    required this.applicationData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mongoState = ref.watch(applicationData.status);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(applicationData.name),
        mongoState.loading
            ? const SizedBox(
                height: 20, width: 20, child: CircularProgressIndicator())
            : mongoState.status
                ? ClipOval(
                    child: InkWell(
                      onTap: () {
                        ref.read(applicationData.stop);
                      },
                      child: const Icon(
                        Icons.stop_outlined,
                        color: Colors.red,
                      ),
                    ),
                  )
                : ClipOval(
                    child: InkWell(
                      onTap: () {
                        ref.read(applicationData.start);
                        ref.read(applicationData.status.notifier).updateState();
                      },
                      child: const Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.green,
                      ),
                    ),
                  ),
      ],
    );
  }
}

// Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(applicationData.name),
//         mongoState.loading
//             ? const CircularProgressIndicator()
//             : mongoState.status
//                 ? GestureDetector(
//                     onTap: () {
//                       ref.read(applicationData.stop);
//                       ref.read(applicationData.status.notifier).updateState();
//                     },
//                     child: Icon(CupertinoIcons.stop),
//                   )
//                 : GestureDetector(
//                     onTap: () {
//                       ref.read(applicationData.start);
//                       ref.read(applicationData.status.notifier).updateState();
//                     },
//                     child: Icon(CupertinoIcons.play),
//                   ),
//       ],
//     );