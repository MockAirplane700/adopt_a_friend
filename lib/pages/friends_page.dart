import 'package:adopt_a_friend/constants/custom_variables.dart';
import 'package:adopt_a_friend/logic/database_logic.dart';
import 'package:adopt_a_friend/objects/friend.dart';
import 'package:flutter/material.dart';

class ViewFriend extends StatefulWidget {
  final Friend friend;
  const ViewFriend({Key? key , required this.friend}) : super(key: key);

  @override
  State<ViewFriend> createState() => _ViewFriendState();
}

class _ViewFriendState extends State<ViewFriend> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('View a friend' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.hasData) {
          Set<List<Friend>> set = snapshot.data;
          List<Friend> friends = set.first;
          if (friends.isEmpty){
            return const Center(child: Text('They are currently no friends for you to adopt'),);
          }else{
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context , index){
                  return GestureDetector(
                    onTap: () {
                      // view friend
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewFriend(friend: friends[index])));
                    },
                    child: Card(
                      shadowColor: shadowColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                      elevation: 8,
                      color: cardBackgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image
                          Image.network(friends[index].images[0]),
                          // name
                          Text(friends[index].name , style: const TextStyle(color: textColor),),
                          // breed
                          Text('Breed: ${friends[index].breed}' , style: const TextStyle(color: textColor),),
                          // age
                          Text('Age: ${friends[index].age.toString()}' , style: const TextStyle(color: textColor),),
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
      }, future: DatabaseLogic.fetchFriends(),),
    );
  }
}
