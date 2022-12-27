import 'dart:math';

import 'package:adopt_a_friend/constants/custom_functions.dart';
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
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('View a friend' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height/80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // todo: Image slider
              Image.network(widget.friend.images[0]),
              // Name < == > share
              Padding(
                padding:EdgeInsets.all(height/80),
                child: Row(
                  children: [
                    Expanded(child: Text(widget.friend.name, style: const TextStyle(color: textColor),)),
                    IconButton(onPressed: () {
                      // todo: share the pet
                    }, icon: const Icon(Icons.share))
                  ],
                ),
              ),
              // Age
              Row(
                children: [
                  Text('Age: ${widget.friend.age.toString()}', style: const TextStyle(color: textColor, fontSize: 15),),
                ],
              ),
              // Species
              Row(
                children: [
                  Text('Species: ${widget.friend.species}', style: const TextStyle(color: textColor),),
                ],
              ),
              // Breed
              Row(
                children: [
                  Text('Breed: ${widget.friend.breed}', style: const TextStyle(color: textColor),),
                ],
              ),
              // color
              Row(
                children: [
                  Text('Color: ${widget.friend.color}', style: const TextStyle(color: textColor),),
                ],
              ),
              // needs
              Row(
                children: [
                  Text('Note: ${widget.friend.needs}', style: const TextStyle(color: textColor),),
                ],
              ),
              // sex
              Row(
                children: [
                  Text('Sex: ${widget.friend.sex}', style: const TextStyle(color: textColor),),
                ],
              ),
              // description
              Row(
                children: [
                  Text( widget.friend.description, style: const TextStyle(color: textColor),),
                ],
              ),
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
              ),
              //contact for adoption
              // add to wish list
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: ElevatedButton(
                      onPressed: () {
                        // launchEmailIntent(widget.friend.email, 'ADOPT A FRIEND INTEREST IN ${widget.friend.name}');
                      },
                      child: const Text('Contact for adoption')))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
