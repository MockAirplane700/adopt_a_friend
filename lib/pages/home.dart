import 'package:adopt_a_friend/constants/custom_variables.dart';
import 'package:adopt_a_friend/logic/database_logic.dart';
import 'package:adopt_a_friend/objects/friend.dart';
import 'package:adopt_a_friend/objects/wish.dart';
import 'package:adopt_a_friend/pages/view_friend.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1000,
            child: FutureBuilder(builder: (context , snapshot){
              if (snapshot.hasData) {

                Set<Friend> set = snapshot.data;
                List<Friend> friends = set.toList();

                if (friends.isEmpty) {
                  return const Center(child: Text('No friends currently'),);
                }else{
                  return SizedBox(
                    height: height,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context , index) {
                        return GestureDetector(
                          onTap: () {
                            // go to view friend
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewFriend(friend: friends[index])));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
                            shadowColor: shadowColor,
                            color: cardBackgroundColor,
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Image
                                  Expanded(child: Image.network(friends[index].images[0])),
                                  // name
                                  Row(
                                    children: [
                                      Text(friends[index].name ,style: const TextStyle(color: textColor),),
                                    ],
                                  ),
                                  // species
                                  Row(
                                    children: [
                                      Text('Species: ${friends[index].species}' , style: const TextStyle(color: textColor),),
                                    ],
                                  ),
                                  // breed
                                  Row(
                                    children: [
                                      Text('Breed: ${friends[index].breed}' , style: const TextStyle(color: textColor),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: friends.length,
                    ),
                  );
                }//end if-else
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }//end if-else
            },
              future: DatabaseLogic.fetchFriends(),),
          ),
          // getting saved friends
         Expanded(flex: 1, child:  SizedBox(
           height: height/1000000,
           child: FutureBuilder(builder: (context , snapshot) {
             if (snapshot.hasData) {
               List<Wish> wishes = snapshot.data;
               if (wishes.isEmpty) {
                 return Container();
               }else{
                 DatabaseLogic.setWishes(wishes);
                 return Container();
               }//end if-else
             }else{
               return const Center(child: CircularProgressIndicator(),);
             }//end if-else
           },
             future: DatabaseLogic.getWishes(),),
         ),)
        ],
      ),
    );
  }
}
