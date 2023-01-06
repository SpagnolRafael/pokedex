import 'package:pokedex/dtos/pokemon_dto.dart';

abstract class HomeState {}

class HomeStateInitial extends HomeState {
  HomeStateInitial();
}

class HomeStateLoading extends HomeState {
  HomeStateLoading();
}

class HomeStateSuccess extends HomeState {
  final List<Pokemon> pokedex;
  HomeStateSuccess({required this.pokedex});
}
