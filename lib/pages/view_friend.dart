import 'dart:math';

import 'package:adopt_a_friend/constants/custom_variables.dart';
import 'package:adopt_a_friend/logic/database_logic.dart';
import 'package:adopt_a_friend/objects/friend.dart';
import 'package:adopt_a_friend/objects/wish.dart';
import 'package:flutter/material.dart';

class ViewFriend extends StatefulWidget {
  final Friend friend;

  const ViewFriend({Key? key , required this.friend}) : super(key: key);

  @override
  State<ViewFriend> createState() => _ViewFriendState();
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

class _ViewFriendState extends State<ViewFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View a friend' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // todo: Image slider 
            Image.network(widget.friend.images[0]),
            // Name < == > share
            Row(
              children: [
                Text(widget.friend.name, style: const TextStyle(color: textColor),),
                IconButton(onPressed: () {
                  // todo: share the pet
                }, icon: const Icon(Icons.share))
              ],
            ),
            // Age
            Text(widget.friend.age.toString(), style: const TextStyle(color: textColor, fontSize: 15),),
            // Species
            Text('Species: ${widget.friend.species}', style: const TextStyle(color: textColor),),
            // Breed
            Text('Breed: ${widget.friend.breed}', style: const TextStyle(color: textColor),),
            // color
            Text('Color: ${widget.friend.color}', style: const TextStyle(color: textColor),),
            // needs
            Text('Note: ${widget.friend.needs}', style: const TextStyle(color: textColor),),
            // sex
            Text('Sex: ${widget.friend.sex}', style: const TextStyle(color: textColor),),
            // description
            Text( widget.friend.description, style: const TextStyle(color: textColor),),
            // add to wish list
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: ElevatedButton(
                    onPressed: () {
                      DatabaseLogic.insertWish(Wish(
                          id: Random().nextInt(100000),
                          friend: Friend(
                              name: widget.friend.name, breed: widget.friend.breed,
                              species: widget.friend.species, age: widget.friend.age,
                              color: widget.friend.color, sex: widget.friend.sex,
                              description: widget.friend.description,
                              needs: widget.friend.needs, images: widget.friend.images
                          )
                      ), context);
                    },
                    child: const Text('add to wish list')))
              ],
            )

          ],
        ),
      ),
    );
  }
}
