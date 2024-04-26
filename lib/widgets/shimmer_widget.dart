import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const _shimmerBaseColor = Color(0xFFEBEBF4);
const _shimmerHighlightColor = Color(0xFFF4F4F4);

class ShimmerLoading extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }

    return Shimmer.fromColors(
      baseColor: _shimmerBaseColor,
      highlightColor: _shimmerHighlightColor,
      period: const Duration(milliseconds: 1000),
      child: child,
    );
  }
}
