import 'package:flutter/material.dart';
import 'package:exam_practice_rm/dao/character_dao.dart';
import 'package:exam_practice_rm/models/character.dart' as ch;

class CharacterItem extends StatefulWidget {
  const CharacterItem({super.key, required this.character});
  final ch.Character character;

  @override
  State<CharacterItem> createState() => _CharacterItemState();
}

class _CharacterItemState extends State<CharacterItem> {

  bool _isFavorite = false;

  initialize() async{
    _isFavorite = await CharacterDao().isFavorite(widget.character);

    if(mounted){
      setState(() {
        _isFavorite = _isFavorite;
      });
    }
  }

  @override
  void initState(){
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(widget.character.image),
        title: Text(widget.character.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Gender: ${widget.character.gender}"),
            Text("Location: ${widget.character.location}")
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            color: _isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            if (mounted){
              setState(() {
                _isFavorite = !_isFavorite;
                _isFavorite ? CharacterDao().insert(widget.character) : CharacterDao().delete(widget.character);
              });
            }
          },
        ),
      )
    );
  }
}