import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildJobItemPlaceholderShimmer() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPlaceholderShimmer(),
                const SizedBox(height: 8),
                _buildPlaceholderShimmer(width: 150),
                const SizedBox(height: 8),
                _buildPlaceholderShimmer(width: 100),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPlaceholderShimmer(
    {double width = double.infinity, double height = 14}) {
  return Container(
    width: width,
    height: height,
    color: Colors.white,
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: const Duration(milliseconds: 800),
      child: Container(color: Colors.white),
    ),
  );
}
