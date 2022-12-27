import 'package:adopt_a_friend/constants/custom_variables.dart';
import 'package:adopt_a_friend/logic/database_logic.dart';
import 'package:adopt_a_friend/pages/view_friend.dart';
import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

// final String name;
// final String breed;
// final String species;
// final int age;
// final String color;
// final String sex;
// final String description;
// final String needs;
// final List<dynamic> images;

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish list' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: FutureBuilder(builder: (context , snapshot) {
        if (snapshot.hasData) {
          List wishes = snapshot.data;
          if (wishes.isEmpty) {
            return const Center(child: Text('there are currently no wishes'),);
          }else{
            return ListView.builder(
                itemBuilder: (context , index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                    shadowColor: shadowColor,
                    elevation: 8,
                    child: ListTile(
                      leading: Image.network(wishes[index].friend.images[0]),
                      title: Text(wishes[index].friend.name , style: const TextStyle(color: textColor),),
                      subtitle: Text('Age: ${wishes[index].friend.age.toString()} years old'),
                      trailing: IconButton(onPressed: () {
                        DatabaseLogic.deleteWish(wishes[index]);
                      }, icon: const Icon(Icons.delete)),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewFriend(friend: wishes[index].friend)));
                      },

                    ),
                  );
                },
              itemCount: wishes.length,
            );
          }//end if-else
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }//end if-else
      },
      future: DatabaseLogic.getWishes(),),
    );
  }
}
