import 'package:flutter/material.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/view/favorite_page/favorite_screen.dart';
import 'package:pokedex/view/home_page/home_screen.dart';
import 'package:pokedex/view/my_account_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List tabs = const [HomeScreen(), FavoriteScreen(), MyAccountScreen()];
int _index = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: AppColors.selectedTab,
        onTap: (index) => setState(() => _index = index),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_outlined,
              color: _index != 0 ? AppColors.iconGrey : AppColors.selectedTab,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: Icon(
              Icons.favorite_border,
              color: _index != 1 ? AppColors.iconGrey : AppColors.selectedTab,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Minha conta',
            icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: _index != 2
                          ? AppColors.iconGrey
                          : AppColors.selectedTab,
                    )),
                child: Icon(
                  Icons.person_outline_rounded,
                  color:
                      _index != 2 ? AppColors.iconGrey : AppColors.selectedTab,
                )),
          ),
        ],
      ),
    );
  }
}
