import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/features/main_layout/favourite/favourite_tab.dart';
import 'package:evently_app/features/main_layout/home/home_tab.dart';
import 'package:evently_app/features/main_layout/map/map_tab.dart';
import 'package:evently_app/features/main_layout/profile/profile_tap.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [
    const HomeTab(),
    const MapTab(),
    const FavouriteTab(),
    const ProfileTap(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.createEvent,
                );
              },
              child: const Icon(Icons.add),
            ),
    );
  }

  void _selectedItem(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  BottomNavigationBar _bottomNavigationBar() {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BottomNavigationBar(
      onTap: _selectedItem,
      items: [
        BottomNavigationBarItem(
          icon: selectedIndex == 0
              ? const Icon(Icons.home)
              : const Icon(Icons.home_outlined),
          label: appLocalizations.home,
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 1
              ? const Icon(Icons.location_on)
              : const Icon(Icons.location_on_outlined),
          label: appLocalizations.map,
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 2
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border_outlined),
          label: appLocalizations.favourite,
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 3
              ? const Icon(Icons.person)
              : const Icon(Icons.person_2_outlined),
          label: appLocalizations.profile,
        ),
      ],
    );
  }
}
