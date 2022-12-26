import 'package:adopt_a_friend/constants/custom_variables.dart';
import 'package:adopt_a_friend/logic/database_logic.dart';
import 'package:adopt_a_friend/objects/info_card.dart';
import 'package:adopt_a_friend/pages/view_info_card.dart';
import 'package:flutter/material.dart';

class InfoCardsPage extends StatefulWidget {
  const InfoCardsPage({Key? key}) : super(key: key);

  @override
  State<InfoCardsPage> createState() => _InfoCardsPageState();
}

class _InfoCardsPageState extends State<InfoCardsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Cards' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: FutureBuilder(builder: (context , snapshot) {
        if (snapshot.hasData) {
          Set<List<InfoCard>> set = snapshot.data;
          List<InfoCard> cards = set.first;

          if (cards.isEmpty) {
            return const Center(child: Text('They are currently no info cards'),);
          }else{
            return ListView.builder(
                itemBuilder: (context , index) {
                  return GestureDetector(
                    onTap: () {
                      // navigate to info card
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewInfoCard(infoCard: cards[index])));
                    },
                    child: Card(
                      shadowColor: shadowColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                      color: cardBackgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image
                          Image.network(cards[index].image),
                          // Species
                          Text('Species: ${cards[index].species}' , style: const TextStyle(color: textColor),),
                          // breed
                          Text('Breed: ${cards[index].breed}' , style: const TextStyle(color: textColor),),
                        ],
                      ),
                    ),
                  );
                },
              itemCount: cards.length,
            );
          }//end if-else
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }//end if-else
      },future: DatabaseLogic.fetchCards(),)
    );
  }
}
