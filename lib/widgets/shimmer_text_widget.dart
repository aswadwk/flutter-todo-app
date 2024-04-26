import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  final bool isLoading;
  final String text;
  final TextStyle textStyle;

  const ShimmerText({
    required this.isLoading,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return Text(
        text,
        style: textStyle,
      );
    }

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
