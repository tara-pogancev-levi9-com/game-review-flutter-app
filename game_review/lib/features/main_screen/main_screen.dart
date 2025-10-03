import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/main_screen/widgets/header_widget.dart';
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
    final gradients = Theme.of(context).extension<AppGradients>()!;

    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Container(
        decoration: BoxDecoration(
          gradient: gradients.background,
        ),
        child: SafeArea(
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
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.5),
            ],
          ),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onDestinationSelected,
          elevation: 0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_rounded),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.library_books_rounded),
              label: 'Library',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Profile Page',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Home Page',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Search Page',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.library_books_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Library Page',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
