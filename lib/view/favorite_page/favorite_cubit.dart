import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/view/favorite_page/favorite_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteStateInitial());

  List<Pokemon> _favorites = [];

  void getFavorites(List<Pokemon> favorites) {
    emit(FavoriteStateLoading());
    _favorites = favorites;
    emit(FavoriteStateSuccess(favorites: _favorites));
  }

  void deleteFavorite(Pokemon pokemon) {
    emit(FavoriteStateLoading());
    _favorites.removeWhere((poke) => poke.name == pokemon.name);
    emit(FavoriteStateSuccess(favorites: _favorites));
  }
}
