import 'package:pokedex/dtos/pokemon_dto.dart';

abstract class FavoriteState {}

class FavoriteStateInitial extends FavoriteState {
  FavoriteStateInitial();
}

class FavoriteStateLoading extends FavoriteState {
  FavoriteStateLoading();
}

class FavoriteStateSuccess extends FavoriteState {
  final List<Pokemon> favorites;
  FavoriteStateSuccess({required this.favorites});
}
