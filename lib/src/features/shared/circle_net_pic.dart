import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class CircleNetPic extends StatelessWidget {
  const CircleNetPic({
    super.key,
    required this.src,
    required this.height,
    required this.width,
  });

  final double height, width;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(180),
        border: Border.all(
          color: Styles.color.primary,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(2),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(180),
        child: CachedNetworkImage(
          imageUrl: src,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.red,
          ),
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
              color: Styles.color.accent,
              strokeWidth: 2,
            ),
          ),
        ),
      ),
    );
  }
}
