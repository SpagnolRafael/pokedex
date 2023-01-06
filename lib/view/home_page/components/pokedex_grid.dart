import 'package:flutter/material.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/shared/widgets/poke_card.dart';

class PokeGrid extends StatefulWidget {
  final List<Pokemon> pokedex;
  const PokeGrid({required this.pokedex, super.key});

  @override
  State<PokeGrid> createState() => _PokeGridState();
}

class _PokeGridState extends State<PokeGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.pokedex.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 6 / 4.5),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: PokeCard(pokemon: widget.pokedex[index]),
      ),
      shrinkWrap: true,
    );
  }
}
