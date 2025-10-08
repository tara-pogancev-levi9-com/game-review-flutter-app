import 'package:flutter/material.dart';
import 'package:game_review/features/home_screen/home_page.dart';
import 'package:game_review/features/library_screen/library_page.dart';
import 'package:game_review/features/main_screen/widgets/appScaffold.dart';
import 'package:game_review/features/main_screen/widgets/header_widget.dart';
import 'package:game_review/features/profile/profile_page.dart';
import 'package:game_review/features/search_screen/search_page.dart';
import 'package:game_review/i18n/strings.g.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<int> _history = [0];

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const LibraryPage(),
    const ProfilePage(),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _history.remove(index);
      _history.add(index);
    });
  }

  void _onBackPressed() {
    setState(() {
      if (_history.length > 1) {
        _history.removeLast();
        _selectedIndex = _history.last;
      } else {
        _selectedIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final translations = context.t;

    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              isHome: _selectedIndex == 0,
              onBack: _onBackPressed,
            ),
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.5),
            ],
          ),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onDestinationSelected,
          elevation: 0,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_rounded),
              label: translations.navigation.home,
            ),
            NavigationDestination(
              icon: const Icon(Icons.search_rounded),
              label: translations.navigation.search,
            ),
            NavigationDestination(
              icon: const Icon(Icons.library_books_rounded),
              label: translations.navigation.library,
            ),
            NavigationDestination(
              icon: const Icon(Icons.person_rounded),
              label: translations.navigation.profile,
            ),
          ],
        ),
      ),
    );
  }
}
