import 'package:ganme_of_thrones/api/api.dart';
import 'package:ganme_of_thrones/models/characters_model.dart';

class AllCharactersService
{
  Future<List<CharactersModel>> getAllCharacters()async
  {
    List<dynamic> data = await Api().getRequest(url:'https://thronesapi.com/api/v2/Characters');
    List<CharactersModel> characters = [];
    for(int i =0; i<data.length; i++)
    {
      characters.add(CharactersModel.fromJson(data[i]));
    }
    return characters;
  }
}