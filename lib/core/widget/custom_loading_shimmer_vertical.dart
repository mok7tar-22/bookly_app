import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingShimmer extends StatelessWidget {
  final Axis? scrollDirection;
  final double height;
  final double width;
  const CustomLoadingShimmer(
      {Key? key,
      this.scrollDirection,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: scrollDirection ?? Axis.vertical,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: height,
                width: width,
                margin: const EdgeInsets.only(bottom: 12, right: 12),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(16),
                ),
              );
            }));
  }
}
