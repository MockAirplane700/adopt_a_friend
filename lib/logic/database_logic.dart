import 'package:adopt_a_friend/objects/wish.dart';
import 'package:adopt_a_friend/persistence/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseLogic {
  static List<Wish> wishes = [];
  
  static void setWishes(List<Wish> wish) {
    wishes.clear();
    wishes.addAll(wish);
  }
  
  static Future fetchFriends() async{
    return DatabaseManager.getFriends();
  }

  static Future fetchCards() async {
    return DatabaseManager.getCards();
  }

  static Future fetchShelters() async {
    return DatabaseManager.getShelters();
  }
  
  static Future insertWish(Wish wish, BuildContext context) async {
    bool boolean = true;
    for (var value in wishes) {
      if (value.friend.name.contains(wish.friend.name) && value.friend.description.contains(wish.friend.description)){
        boolean = false;
      }
      
      if (boolean){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('item has been added')));
        return DatabaseManager.insertItem(wish);   
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('item has already been added')));
      }
    }
  }
  
  static Future getWishes() async {
    return DatabaseManager.getItems();
  }
  
  static void deleteWish(Wish wish) async {
    return DatabaseManager.deleteItem(wish);
  }
}