
import 'package:flutter/material.dart';
import 'package:ganme_of_thrones/models/characters_model.dart';
import 'package:ganme_of_thrones/services/characters_service.dart';


import 'package:ganme_of_thrones/ui/characters_item.dart';

class HomePage  extends StatelessWidget {

   const HomePage({Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context ) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Game Of Thrones'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: FutureBuilder<List<CharactersModel>>(

            future: AllCharactersService().getAllCharacters(),
            builder: (context , AsyncSnapshot<dynamic> snapshot) {
              try
              {
                List<CharactersModel> allCharacters =  snapshot.data;
                // ignore: unnecessary_null_comparison
                if(snapshot.hasData != null)
                {
                  return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                  ),
                      itemCount: allCharacters.length,
                      itemBuilder: (context,index)
                      {
                        return  CharacterItem(character: allCharacters[index],);
                      }
                  );
                }

              }catch (error)
            {
              debugPrint('error ==========>>>>>>>>>>>>${error.toString()}');
            }
            return const Center(child: CircularProgressIndicator(color: Colors.grey,));
              }


        ),
      ),
    );
  }
}


