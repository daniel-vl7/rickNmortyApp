import 'package:exam_practice_rm/screens/widgets/character_item.dart';
import 'package:exam_practice_rm/screens/widgets/custom_search_bar.dart';
import 'package:exam_practice_rm/services/character_service.dart';
import 'package:flutter/material.dart';
import 'package:exam_practice_rm/models/character.dart';


class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({super.key});

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {

  List<Character> characters = [];
  final CharacterService _characterService = CharacterService();
  int charactersCount = 0;

  Future<void> _fetchCharacters(String value) async {
    try{
      List<Character> result = await _characterService.getCharactersFromApi(value) as List<Character>;
      setState(() {
        characters = result;
      });
      print("Respuesta sin error ${characters[0]}");
    } catch(e){
      print("Se encontro el error:  $e");
    }  
  }

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick & Morty characters"),
      ),
      body: Center(
        child: Column(
          children: [
            CustomSearchBar(callback: (value){_fetchCharacters(value);}),
            const SizedBox(height: 20),
            Expanded(child: CharacterList(characters: characters))
          ],
        ),
      ),
    );
  }
}

class CharacterList extends StatelessWidget {
  const CharacterList({super.key, required this.characters});

  final List<Character> characters;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index){
        return CharacterItem(character: characters[index]);
      },
    );
  }
}