import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:exam_practice_rm/models/character.dart';

class CharacterService{

  final String baseUrl = "https://rickandmortyapi.com/api/character/?name=";

  Future<List> getCharactersFromApi(String characterName) async{

    http.Response response = await http.get(Uri.parse("$baseUrl$characterName"));

    if (response.statusCode == HttpStatus.ok){
      final Map<String, dynamic> responseMap = json.decode(response.body);
      List maps = responseMap["results"];
      print("$baseUrl$characterName");
      return maps.map((map)=> Character.fromJson(map)).toList();  
    } else{
      print("Error");
    }
    return [];
  }
}