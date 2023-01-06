import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/view/home_page/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  final PokemonRepository pokeRepository = PokemonRepository(Dio());

  Future<void> getPokemons() async {
    emit(HomeStateLoading());
    final pokemons = await pokeRepository.getPokemons();
    emit(HomeStateSuccess(pokedex: pokemons));
  }
}
