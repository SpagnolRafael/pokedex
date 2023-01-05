import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final List<BoxShadow>? boxShadow;
  final String? path;
  final Color? color;
  final double? height;
  final double? radius;
  final double? width;
  final void Function()? onTap;
  final String text;
  final TextStyle? style;
  const CustomButton({
    required this.text,
    super.key,
    this.onTap,
    this.style,
    this.height = 43,
    this.radius = 10,
    this.color,
    this.width,
    this.path,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: color,
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              text,
              style: style,
            ),
            const Spacer(),
            if (path != null) SvgPicture.asset(path!),
          ],
        ),
      ),
    );
  }
}
