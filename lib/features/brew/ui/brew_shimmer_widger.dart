import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BrewShimmerWidget extends StatelessWidget {
  const BrewShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const shimmerBaseColor = Color.fromARGB(255, 67, 67, 67);
    const shimmerHighlightColor = Color.fromARGB(255, 252, 252, 252);
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            baseColor: shimmerBaseColor,
            highlightColor: shimmerHighlightColor,
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.06),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          trailing: Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            baseColor: shimmerBaseColor,
            highlightColor: shimmerHighlightColor,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.06),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}
