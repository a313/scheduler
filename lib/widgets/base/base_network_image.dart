import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BaseNetworkImage extends StatelessWidget {
  const BaseNetworkImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    super.key,
    this.onLoading,
    this.onError,
    this.borderRadius = BorderRadius.zero,
  });
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? onLoading;
  final Widget? onError;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    bool validURL = Uri.parse(imageUrl).isAbsolute;

    if (validURL) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) {
          return ClipRRect(
            borderRadius: borderRadius,
            child: Image(
              image: imageProvider,
              width: width,
              height: height,
              fit: fit,
            ),
          );
        },
        placeholder: (context, url) {
          return onLoading ??
              const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                  ),
                ),
              );
        },
        errorWidget: (context, url, error) =>
            onError ?? const Icon(Icons.error),
      );
    } else {
      return onError ?? const Icon(Icons.error);
    }
  }
}
