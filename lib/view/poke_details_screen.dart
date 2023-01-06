import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/screen_size.dart';
import 'package:pokedex/shared/widgets/stats_widget.dart';
import 'package:pokedex/view/home_page/components/header.dart';

class PokeDetailsScreen extends StatefulWidget {
  final Pokemon? pokemon;
  const PokeDetailsScreen({this.pokemon, super.key});

  @override
  State<PokeDetailsScreen> createState() => _PokeDetailsScreenState();
}

class _PokeDetailsScreenState extends State<PokeDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokeDetails = ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.pokeDetailImg,
                width: ScreenSize.width(context),
                height: ScreenSize.width(context) * 80 / 100,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 220,
                    child: Image.network(
                        pokeDetails.sprites.other?.officialArt.frontDefault ??
                            ''),
                  ),
                ),
              ),
              Header(
                icon: Icons.arrow_back_ios,
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pokeDetails.name[0].toUpperCase()}${pokeDetails.name.substring(1).toLowerCase()}',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.pokecardTitle,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    'Cod: ${pokeDetails.id ?? '#Não localizado'}',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.pokecardTitle,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Descrição',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.pokecardTitle,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatsWidget(
                  stats: pokeDetails.stats[0].baseStats!, type: StatsType.life),
              const SizedBox(height: 15),
              StatsWidget(
                  stats: pokeDetails.stats[2].baseStats!,
                  type: StatsType.defense),
              const SizedBox(height: 15),
              StatsWidget(
                  stats: pokeDetails.stats[1].baseStats!,
                  type: StatsType.attack),
            ],
          ),
          Text(
            'HP: ${pokeDetails.stats[0].baseStats ?? '#Não localizado'}${pokeDetails.stats[0].stat.name}',
            style: GoogleFonts.getFont(
              'Nunito',
              textStyle: const TextStyle(
                fontFamily: 'Nunito',
                color: AppColors.pokecardTitle,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            'ATTACK: ${pokeDetails.stats[1].baseStats ?? '#Não localizado'}${pokeDetails.stats[1].stat.name}',
            style: GoogleFonts.getFont(
              'Nunito',
              textStyle: const TextStyle(
                fontFamily: 'Nunito',
                color: AppColors.pokecardTitle,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            'DEFENSE: ${pokeDetails.stats[2].baseStats ?? '#Não localizado'}${pokeDetails.stats[2].stat.name}',
            style: GoogleFonts.getFont(
              'Nunito',
              textStyle: const TextStyle(
                fontFamily: 'Nunito',
                color: AppColors.pokecardTitle,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
