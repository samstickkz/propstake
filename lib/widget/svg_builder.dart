import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgBuilder extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final double? size;
  final BoxFit? fit;
  final Color? color;
  const SvgBuilder(
      this.image, {
        super.key,
        this.height,
        this.width,
        this.size,
        this.fit,
        this.color
      });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height?? size,
      width: height?? size,
      fit: fit ?? BoxFit. contain,
      colorFilter: color == null? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}

class ImageBuilder extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final double? size;
  final BoxFit? fit;
  final Color? color;
  const ImageBuilder(
      this.image, {
        super.key,
        this.height,
        this.width,
        this.size,
        this.fit,
        this.color
      });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height?? size,
      width: height?? size,
      fit: fit ?? BoxFit. contain,
      color: color,
    );
  }
}
