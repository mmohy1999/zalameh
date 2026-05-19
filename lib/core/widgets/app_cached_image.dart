import 'dart:io';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/theming/colors.dart';

class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.fallback,
    this.fallbackAsset = AppImages.logoImage,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? fallback;
  final String fallbackAsset;

  static bool isNetworkPath(String? imagePath) {
    final trimmedPath = imagePath?.trim() ?? '';
    return trimmedPath.startsWith('http://') ||
        trimmedPath.startsWith('https://');
  }

  static bool isFilePath(String? imagePath) {
    final trimmedPath = imagePath?.trim() ?? '';
    return trimmedPath.startsWith('/') || trimmedPath.startsWith('file://');
  }

  @override
  Widget build(BuildContext context) {
    final trimmedPath = imagePath.trim();

    if (trimmedPath.isEmpty) {
      return _buildFallback();
    }

    if (isFilePath(trimmedPath)) {
      final filePath =
          trimmedPath.startsWith('file://')
              ? Uri.parse(trimmedPath).toFilePath()
              : trimmedPath;

      return Image.file(
        File(filePath),
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildFallback(),
      );
    }

    if (!isNetworkPath(trimmedPath)) {
      return Image.asset(
        trimmedPath,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildFallback(),
      );
    }

    return CachedNetworkImage(
      imageUrl: trimmedPath,
      width: width,
      height: height,
      fit: fit,
      placeholder:
          (context, url) => const Center(
            child: CircularProgressIndicator(color: ColorsManager.primaryColor),
          ),
      errorBuilder: (context, error, stackTrace) => _buildFallback(),
    );
  }

  Widget _buildFallback() {
    return fallback ??
        Image.asset(fallbackAsset, width: width, height: height, fit: fit);
  }
}
