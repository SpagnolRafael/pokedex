import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? radius;
  final double? width;
  final void Function()? onTap;
  final String text;
  final TextStyle? style;
  const CustomButton(
      {required this.text,
      super.key,
      this.onTap,
      this.style,
      this.height = 43,
      this.radius = 10,
      this.color,
      this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: Center(
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}
