import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/view/home_page/home_state.dart';

@singleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  final PokemonRepository pokeRepository = PokemonRepository(Dio());
  List<Pokemon> originalList = [];

  Future<void> getPokemons() async {
    emit(HomeStateLoading());
    final pokemons = await pokeRepository.getPokemons();
    originalList = pokemons;
    emit(HomeStateSuccess(pokedex: pokemons));
  }

  void filterPokemons(List<Pokemon> pokedex, String query) {
    emit(HomeStateLoading());
    pokedex = query.isNotEmpty
        ? pokedex.where((pokemon) => pokemon.name.contains(query)).toList()
        : originalList;

    emit(HomeStateSuccess(pokedex: pokedex));
  }
}
