// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokedex/view/favorite_page/favorite_cubit.dart' as _i3;
import 'package:pokedex/view/home_page/home_cubit.dart' as _i4;
import 'package:pokedex/view/poke-details/poke_details_cubit.dart' as _i5;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.FavoriteCubit>(() => _i3.FavoriteCubit());
  gh.singleton<_i4.HomeCubit>(_i4.HomeCubit());
  gh.factory<_i5.PokeDetailsCubit>(() => _i5.PokeDetailsCubit());
  return getIt;
}
