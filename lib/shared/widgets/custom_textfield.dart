import 'package:flutter/material.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/screen_size.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const CustomTextFormField(
      {required this.controller, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            onChanged: onChanged,
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
