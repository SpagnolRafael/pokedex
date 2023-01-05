import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/assets.dart';
import 'package:pokedex/shared/widgets/banner.dart';
import 'package:pokedex/shared/widgets/filter_element_widget.dart';
import 'package:pokedex/view/home_page/components/filter_types_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: CustomBanner(
                  controller: _searchController,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Image.asset(Assets.elipseGroup),
                ),
              ),
            ],
          ),
          const SizedBox(height: 19),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Tipo',
                style: GoogleFonts.getFont(
                  'Nunito',
                  textStyle: const TextStyle(
                    fontFamily: 'Nunito',
                    color: AppColors.title,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 8),
                    child: Image.asset(Assets.elipse),
                  )),
              FilterTypeList(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 55),
                  child: Text(
                    'Mais procurados',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.title,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
