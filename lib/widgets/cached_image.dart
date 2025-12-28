import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    this.boxFit,
  });

  final String imageUrl;
  final double? imageHeight;
  final double? imageWidth;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
      width: imageWidth ?? screenSize.width * 0.2,
      height: imageHeight ?? screenSize.width * 0.3,
      imageUrl: imageUrl,
      fit: boxFit ?? BoxFit.cover,
      errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: Colors.red),
    );
  }
}
