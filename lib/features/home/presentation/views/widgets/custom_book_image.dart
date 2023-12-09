import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String? imageUrl;
  const CustomBookImage({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: imageUrl != null
            ? CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl!,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              )
            : const Center(child: Text("Not Image Found")),
      ),
    );
  }
}
