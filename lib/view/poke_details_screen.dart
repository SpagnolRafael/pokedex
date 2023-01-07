import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/screen_size.dart';
import 'package:pokedex/shared/widgets/filter_element_widget.dart';
import 'package:pokedex/shared/widgets/stats_widget.dart';
import 'package:pokedex/view/favorite_page/favorite_screen.dart';
import 'package:pokedex/view/home_page/components/header.dart';
import 'package:pokedex/view/poke-details/poke_details_cubit.dart';
import 'package:pokedex/view/poke-details/poke_details_state.dart';

class PokeDetailsScreen extends StatefulWidget {
  final Pokemon? pokemon;
  final void Function(Pokemon pokemon)? callBack;
  const PokeDetailsScreen({this.pokemon, this.callBack, super.key});

  @override
  State<PokeDetailsScreen> createState() => _PokeDetailsScreenState();
}

class _PokeDetailsScreenState extends State<PokeDetailsScreen> {
  final cubit = getIt<PokeDetailsCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokeDetails = ModalRoute.of(context)!.settings.arguments as Pokemon;
    IconData iconData = FavoriteScreen.favorite.contains(pokeDetails)
        ? Icons.favorite
        : Icons.favorite_border_outlined;

    return BlocConsumer<PokeDetailsCubit, PokeDetailsState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is PokeDetailsStateSuccess) iconData = state.iconData;
      },
      builder: (context, state) {
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
                        child: Image.network(pokeDetails
                                .sprites.other?.officialArt.frontDefault ??
                            ''),
                      ),
                    ),
                  ),
                  Header(
                    icon: Icons.arrow_back_ios,
                    onTap: () {
                      Navigator.pop(context, pokeDetails);
                    },
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
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () => cubit
                                          .addOrRemovePokeFavorite(pokeDetails),
                                      child: Icon(
                                        iconData,
                                        color: AppColors.iconButton,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const InkWell(
                                      child: Icon(
                                        Icons.share_rounded,
                                        color: AppColors.iconButton,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Text(
                                  'Cod: #00${pokeDetails.id ?? '#Não localizado'}',
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
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20.0, top: 30),
                                child: FilterElementType(
                                  radius: 2,
                                  label: ElementTypeExt.label(
                                      ElementTypeExt.fromType(
                                          pokeDetails.types.length > 1
                                              ? pokeDetails.types[1].type.name
                                              : pokeDetails
                                                  .types[0].type.name)),
                                  color: ElementTypeExt.color(
                                      ElementTypeExt.fromType(
                                          pokeDetails.types.length > 1
                                              ? pokeDetails.types[1].type.name
                                              : pokeDetails
                                                  .types[0].type.name)),
                                ),
                              ),
                            ],
                          ),
                        ],
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
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          '"${pokeDetails.name[0].toUpperCase()}${pokeDetails.name.substring(1).toLowerCase()} destrói seus oponentes sem pena com suas garras afiadas. Torna-se agressivo quando encontra um oponente forte e então a chama na ponta da sua cauda queima intensamente em uma cor azulada."',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.getFont(
                            'Nunito',
                            textStyle: const TextStyle(
                              fontFamily: 'Nunito',
                              color: AppColors.pokecardTitle,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Vida',
                                  style: GoogleFonts.getFont(
                                    'Nunito',
                                    textStyle: const TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppColors.pokecardTitle,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 71),
                                StatsWidget(
                                    stats: pokeDetails.stats[0].baseStats!,
                                    type: StatsType.life),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  'Defesa',
                                  style: GoogleFonts.getFont(
                                    'Nunito',
                                    textStyle: const TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppColors.pokecardTitle,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 58),
                                StatsWidget(
                                    stats: pokeDetails.stats[2].baseStats!,
                                    type: StatsType.defense),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  'Ataque',
                                  style: GoogleFonts.getFont(
                                    'Nunito',
                                    textStyle: const TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppColors.pokecardTitle,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 57),
                                Align(
                                  alignment: Alignment.center,
                                  child: StatsWidget(
                                      stats: pokeDetails.stats[1].baseStats!,
                                      type: StatsType.attack),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
