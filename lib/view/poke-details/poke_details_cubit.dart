// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/view/favorite_page/favorite_screen.dart';
import 'package:pokedex/view/poke-details/poke_details_state.dart';

@injectable
class PokeDetailsCubit extends Cubit<PokeDetailsState> {
  PokeDetailsCubit() : super(PokeDetailsStateInitial());
  final PokemonRepository pokeRepository = PokemonRepository(Dio());
  List<Pokemon> originalList = [];

  void addOrRemovePokeFavorite(Pokemon pokeDetails) {
    print(FavoriteScreen.favorite.contains(pokeDetails));
    emit(PokeDetailsStateInitial());
    if (FavoriteScreen.favorite.contains(pokeDetails))
      FavoriteScreen.favorite
          .removeWhere((pokemon) => pokemon.name == pokeDetails.name);
    else
      FavoriteScreen.favorite.add(pokeDetails);
    print(FavoriteScreen.favorite.contains(pokeDetails));

    emit(PokeDetailsStateSuccess(
        iconData: FavoriteScreen.favorite.contains(pokeDetails)
            ? Icons.favorite
            : Icons.favorite_border_outlined));
    // Navigator.pushNamed(context, '/poke-details', arguments: pokeDetails);
  }
}
