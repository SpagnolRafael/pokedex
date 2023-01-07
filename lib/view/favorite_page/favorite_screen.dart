// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/screen_size.dart';
import 'package:pokedex/view/favorite_page/components/favorite_card.dart';
import 'package:pokedex/view/favorite_page/favorite_cubit.dart';
import 'package:pokedex/view/favorite_page/favorite_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  static List<Pokemon> favorite = [];

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Pokemon> _favorites = [];
  final cubit = getIt<FavoriteCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getFavorites(FavoriteScreen.favorite);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is FavoriteStateSuccess) _favorites = state.favorites;
      },
      builder: (context, state) {
        if (state is FavoriteStateLoading)
          return const Center(child: CircularProgressIndicator());
        else
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Favoritos',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.title,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 300,
                      height: ScreenSize.heigh(context),
                      child: ListView.separated(
                          itemBuilder: (context, index) => FavoriteCard(
                                callBack: (pokemon) =>
                                    FavoriteScreen.favorite.contains(pokemon)
                                        ? null
                                        : cubit.deleteFavorite(pokemon),
                                pokemon: FavoriteScreen.favorite[index],
                                onTap: () => cubit.deleteFavorite(
                                  FavoriteScreen.favorite[index],
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: FavoriteScreen.favorite.length),
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
