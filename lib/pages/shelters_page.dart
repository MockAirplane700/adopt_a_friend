import 'package:adopt_a_friend/constants/custom_variables.dart';
import 'package:adopt_a_friend/logic/database_logic.dart';
import 'package:adopt_a_friend/objects/shelter.dart';
import 'package:adopt_a_friend/pages/view_shelter.dart';
import 'package:flutter/material.dart';

class SheltersPage extends StatefulWidget {
  const SheltersPage({Key? key}) : super(key: key);

  @override
  State<SheltersPage> createState() => _SheltersPageState();
}

class _SheltersPageState extends State<SheltersPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shelters' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: FutureBuilder(builder: (context, snapshot){
        if (snapshot.hasData) {
          Set<List<Shelter>> set = snapshot.data;
          List<Shelter> shelters = set.first;

          if (shelters.isEmpty) {
            return const Center(child: Text('There are no shelters currently.'),);
          }else{
            return ListView.builder(
                itemBuilder: (context , index) {
                  return GestureDetector(
                    onTap: () {
                      // go to view shelter
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewShelter(shelter: shelters[index])));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                      shadowColor: shadowColor,
                      color: cardBackgroundColor,
                      elevation: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image of shelter
                          Image.network(shelters[index].image),
                          // name of shelter
                          Text(shelters[index].name, style: const TextStyle(color: textColor),),
                          // location
                          Text('Located at: ${shelters[index].address}' , maxLines: 3, style: const TextStyle(color: textColor),),
                          // short description
                          Text( shelters[index].description , maxLines: 4, overflow: TextOverflow.ellipsis,style: const TextStyle(color: textColor),)

                        ],
                      ),
                    ),
                  );
                },
              itemCount: shelters.length,
            );
          }//end if-else
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }//end if-else
      },
      future: DatabaseLogic.fetchShelters(),),
    );
  }
}
