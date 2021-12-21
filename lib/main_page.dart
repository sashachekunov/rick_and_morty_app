import 'package:chekunov_rick_and_morty_client/core/app_text_styles.dart';
import 'package:chekunov_rick_and_morty_client/core/app_theme_colors.dart';
import 'package:chekunov_rick_and_morty_client/core/launch_url.dart';
import 'package:chekunov_rick_and_morty_client/core/rick_and_morty_icons.dart';
import 'package:chekunov_rick_and_morty_client/features/character/presentation/characters_page.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = [
    const CharactersPage(),
    Center(
        child: Text(
      'Episodes TODO',
      style: AppTextStyles.bottonNavigationBarTextStyle,
    )),
    Center(
        child: Text(
      'Locations TODO',
      style: AppTextStyles.bottonNavigationBarTextStyle,
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Icon(
          RickAndMortyIcons.rickAndMortyLogo,
          color: AppColors.logoColor,
        ),
        centerTitle: false,
        actions: [
          TextButton(
            child: Text(
              'Docs',
              style: AppTextStyles.appBarTextStyle,
            ),
            onPressed: () {
              launchURL('https://rickandmortyapi.com/documentation');
            },
          ),
          TextButton(
            child: Text(
              'About',
              style: AppTextStyles.appBarTextStyle,
            ),
            onPressed: () {
              launchURL('https://rickandmortyapi.com/about');
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: AppColors.barBackground,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        unselectedItemColor: AppColors.greyColor,
        selectedItemColor: AppColors.selectedItem,
        selectedLabelStyle: AppTextStyles.bottonNavigationBarTextStyle,
        unselectedLabelStyle: AppTextStyles.bottonNavigationBarTextStyle,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_outlined),
            label: 'Characters',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_stable_outlined),
            label: 'Episodes',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Locations',
            tooltip: '',
          ),
        ],
      ),
      body: IndexedStack(
        children: pages,
        index: currentIndex,
      ),
    );
  }
}
