import 'package:adopt_a_friend/constants/custom_variables.dart';
import 'package:adopt_a_friend/logic/database_logic.dart';
import 'package:adopt_a_friend/objects/friend.dart';
import 'package:adopt_a_friend/objects/wish.dart';
import 'package:adopt_a_friend/pages/friends_page.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(builder: (context , snapshot){
              if (snapshot.hasData) {
                Set<List<Friend>> set = snapshot.data;
                List<Friend> friends = set.first;

                if (friends.isEmpty) {
                  return const Center(child: Text('No friends currently'),);
                }else{
                  return GridView.builder(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image
                              Image.network(friends[index].images[0]),
                              // name
                              Text(friends[index].name ,style: const TextStyle(color: textColor),),
                              // species
                              Text('Species: \n${friends[index].species}' , style: const TextStyle(color: textColor),),
                              // breed
                              Text('Species: \n${friends[index].species}' , style: const TextStyle(color: textColor),),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: friends.length,
                  );
                }//end if-else
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }//end if-else
            },
              future: DatabaseLogic.fetchFriends(),),
            // getting saved friends
            SizedBox(
              height: height/100,
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
            ),
          ],
        )
      ),
    );
  }
}
