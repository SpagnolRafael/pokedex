// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/assets.dart';
import 'package:pokedex/shared/screen_size.dart';
import 'package:pokedex/shared/widgets/banner.dart';
import 'package:pokedex/view/home_page/components/filter_types_list.dart';
import 'package:pokedex/view/home_page/components/header.dart';
import 'package:pokedex/view/home_page/components/pokedex_grid.dart';
import 'package:pokedex/view/home_page/home_cubit.dart';
import 'package:pokedex/view/home_page/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _searchController;
  final cubit = getIt<HomeCubit>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => cubit.getPokemons());
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Pokemon> _pokedex = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is HomeStateSuccess) _pokedex = state.pokedex;
      },
      builder: (context, state) {
        if (state is HomeStateLoading)
          return const Center(child: CircularProgressIndicator());
        else
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Stack(
                  children: [
                    Header(
                      icon: Icons.menu,
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: CustomBanner(
                        onChanged: (query) {
                          cubit.filterPokemons(_pokedex, query);
                        },
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
                        padding: const EdgeInsets.only(
                            left: 30.0, top: 55, bottom: 10),
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
                SizedBox(
                  width: ScreenSize.width(context),
                  child: PokeGrid(pokedex: _pokedex),
                )
              ],
            ),
          );
      },
    );
  }
}
