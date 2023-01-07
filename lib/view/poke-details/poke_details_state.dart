import 'package:flutter/material.dart';

abstract class PokeDetailsState {}

class PokeDetailsStateInitial extends PokeDetailsState {
  PokeDetailsStateInitial();
}

class PokeDetailsStateLoading extends PokeDetailsState {
  PokeDetailsStateLoading();
}

class PokeDetailsStateSuccess extends PokeDetailsState {
  IconData iconData;
  PokeDetailsStateSuccess({required this.iconData});
}
