import 'package:flutter/material.dart';
import 'package:ganme_of_thrones/models/characters_model.dart';
import 'package:ganme_of_thrones/services/characters_service.dart';

class CharactersDetails  extends StatelessWidget {
  final CharactersModel character;
  const CharactersDetails ({Key? key , required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:FutureBuilder<List<CharactersModel>>(
        future:  AllCharactersService().getAllCharacters(),
        builder:(context,AsyncSnapshot<dynamic> snapshot)
        {
          try
          {
            List<dynamic> allCharacters =  snapshot.data;
            // ignore: unnecessary_null_comparison
            if(snapshot.hasData !=null)
            {
              return ListView.separated(
                separatorBuilder: (context,index){
                  return const Divider(
                    thickness: 1,
                    color: Colors.black,
                  );
                },
                  itemCount: allCharacters.length,
                  itemBuilder: (context,index){
                    return Details(character: allCharacters[index]);
                  }
              );
            }

          }catch (error)
          {
            debugPrint('newError ==========>>>>>>>>>>>>${error.toString()}');
          }

          return const Center(child: CircularProgressIndicator());

        }
      ),
    );
  }
}

class Details extends StatelessWidget {
  final CharactersModel character;

   const Details({
    required this.character,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context ) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(


          children: [

            Card(
              color: Colors.white,
              child: Image.network(
                character.imageUrl
              ),
            ),
            Text(
              character.fullName ,
              style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 4,),

                    Text(' Title : ${character.title}'
                      ,
                      style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                    ),

                  ],
                ),

              ),
            ),

            Text('Family : ${character.family}'
              , style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w300),
            ),



          ],
        ),
      ),
    );
  }
}
