import 'package:exam_practice_rm/screens/characters_list_screen.dart';
import 'package:exam_practice_rm/screens/favorite_characters_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final List<Widget> _tabs = const [
    CharactersListScreen(),
    FavoriteCharactersScreen()
  ];

  final List<BottomNavigationBarItem> _options = const [
    BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorites"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _options,
        onTap: (value){
          setState(() {
            _currentIndex = value;
          },);
        }
      ),
    );
  }
}