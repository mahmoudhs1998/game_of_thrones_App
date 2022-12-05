import 'package:flutter/material.dart';
import 'package:ganme_of_thrones/models/characters_model.dart';

import 'characters_details.dart';

class CharacterItem extends StatelessWidget {
  final CharactersModel character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
          return CharactersDetails(character: character,);
        })),
        child: GridTile(
          child: Hero(
            tag: character.id,
            child: Container(
              color: Colors.grey,
              child:Image.network(
                character.imageUrl,
                fit: BoxFit.fill,

              ),

            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.firstName,
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}