import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tractian_challenge/app/utils/resources/spacing.dart';

class LoadingContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final double borderRadius;

  const LoadingContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.borderRadius = SpacingValue.xxxs,
  });

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xFFC1C5D0);
    Color highlightColor = const Color(0xFFFFFFFF);

    return Shimmer(
      period: const Duration(milliseconds: 800),
      gradient: LinearGradient(
        colors: [baseColor, baseColor, highlightColor, baseColor, baseColor],
        stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
      ),
      child: child != null
          ? Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadiusDirectional.circular(borderRadius),
              ),
              child: child,
            )
          : Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadiusDirectional.circular(borderRadius),
              ),
            ),
    );
  }
}
