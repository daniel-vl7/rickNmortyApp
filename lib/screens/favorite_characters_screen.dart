import 'package:exam_practice_rm/dao/character_dao.dart';
import 'package:exam_practice_rm/screens/characters_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:exam_practice_rm/models/character.dart';

class FavoriteCharactersScreen extends StatefulWidget {
  const FavoriteCharactersScreen({super.key});

  @override
  State<FavoriteCharactersScreen> createState() => _FavoriteCharactersScreenState();
}

class _FavoriteCharactersScreenState extends State<FavoriteCharactersScreen> {

  List<Character> characters = [];
  final CharacterDao _characterDao = CharacterDao();

  @override
  void initState(){
    super.initState();
    initialize();
  }

  initialize() async{
    try{
      List<Character> result = await _characterDao.getAll(); 

      if(mounted){
        setState(() {
          characters = result;
        });
      }

    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite characters"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: CharacterList(characters: characters))
          ],
        ),
      ),
    );
  }
}