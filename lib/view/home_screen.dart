import 'package:flutter/material.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/assets.dart';
import 'package:pokedex/shared/widgets/banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 5),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.menu,
                    color: AppColors.title,
                  ),
                  Image.asset(Assets.logo),
                  Image.asset(
                    Assets.userProfile,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: CustomBanner(),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Image.asset(Assets.elipseGroup),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
