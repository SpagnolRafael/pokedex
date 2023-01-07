import 'package:flutter/material.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/view/favorite_page/favorite_screen.dart';
import 'package:pokedex/view/main_screen.dart';
import 'package:pokedex/view/poke_details_screen.dart';
import 'package:pokedex/view/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WellcomeScreen(),
      routes: {
        '/home': (context) => const MainScreen(),
        '/favorite': (context) => const FavoriteScreen(),
        '/poke-details': (context) => const PokeDetailsScreen(),
      },
    );
  }
}
