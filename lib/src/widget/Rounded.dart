import 'package:flutter/material.dart';
import 'package:planet/src/constants/Colors.dart';


class RoundedContainer extends StatelessWidget {
  final Widget child;
  final bool? isShadow;
  final Color? color;
  final Color? borderColor;
  final double? radius;
  final double? width;
  final double? height;
  final double? border;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? blurRadius;
  final Color? shadowColor;

  const RoundedContainer({
    Key? key,
    required this.child,
    this.isShadow,
    this.color,
    this.borderColor,
    this.radius,
    this.width,
    this.height,
    this.padding,
    this.gradient,
    this.margin,
    this.border,
    this.blurRadius,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isShadow = isShadow ?? false;
    return Container(
      width: width,
      height: height,
      margin: margin ?? const EdgeInsets.all(5.0),
      padding: padding ?? const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: color ?? white,
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius ?? 18),
          border: Border.all(
            width: border ?? 0.0,
            color: borderColor ?? white,
          ),
          boxShadow: [
            BoxShadow(
              color: _isShadow
                  ? shadowColor ?? Colors.black12
                  : Colors.transparent,
              blurRadius: blurRadius ?? 5.0,
            ),
          ]),
      child: child,
    );
  }
}
