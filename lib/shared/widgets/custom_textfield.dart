import 'package:flutter/material.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/screen_size.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextFormField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.subtitle,
              blurRadius: 15,
              offset: Offset(0, 4),
            ),
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            topLeft: Radius.circular(5),
          )),
      height: 31,
      width: ScreenSize.width(context) * 30 / 100,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: TextField(
            controller: controller,
            autocorrect: false,
            decoration: const InputDecoration(
                border: InputBorder.none, contentPadding: EdgeInsets.all(10)),
          ),
        ),
      ),
    );
  }
}
