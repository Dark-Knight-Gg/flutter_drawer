import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAssetIcon extends StatelessWidget {
  final String name;
  final double size;
  final BoxFit fit;

  const AppAssetIcon({
    required this.name,
    this.size = 24,
    this.fit = BoxFit.contain,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      width: size,
      height: size,
      fit: fit,
      image: AssetImage(name),
    );
  }
}

class AppNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final BoxShape boxShape;
  final double borderWidth;
  final Color borderColor;
  final BorderRadiusGeometry? borderRadius;

  const AppNetworkImage(
    this.url, {
    this.width = 48,
    this.height = 48,
    this.fit = BoxFit.contain,
    this.boxShape = BoxShape.rectangle,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.borderRadius,
    super.key,
  })  : assert(borderWidth >= 0),
        assert(width >= 0),
        assert(height >= 0);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: boxShape,
          border: Border.all(width: borderWidth, color: borderColor),
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: boxShape,
          border: Border.all(width: borderWidth, color: borderColor),
          borderRadius: borderRadius,
        ),
        child: const CupertinoActivityIndicator(
          radius: 12,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: boxShape,
          border: Border.all(width: borderWidth, color: borderColor),
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

class AppAssetImage extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final BoxFit fit;
  final BoxShape boxShape;
  final double borderWidth;
  final Color borderColor;

  const AppAssetImage(
    this.name, {
    this.width = 48,
    this.height = 48,
    this.fit = BoxFit.contain,
    this.boxShape = BoxShape.rectangle,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    super.key,
  })  : assert(borderWidth >= 0),
        assert(width >= 0),
        assert(height >= 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: boxShape,
        border: Border.all(color: borderColor, width: borderWidth),
        image: DecorationImage(
          image: AssetImage(name),
        ),
      ),
    );
  }
}
