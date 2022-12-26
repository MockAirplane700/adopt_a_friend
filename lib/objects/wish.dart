import 'package:adopt_a_friend/constants/custom_functions.dart';
import 'package:adopt_a_friend/objects/friend.dart';

class Wish {
  final int id;
  final Friend friend;
  
  // Friend friend = Friend(
  //     name: name, breed: breed, species: species, 
  //     age: age, color: color, sex: sex, description: description, 
  //     needs: needs, images: images)

  Wish({
    required this.id, required this.friend
});
  
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : friend.name,
      'breed' : friend.breed,
      'species' : friend.species,
      'age' : friend.age,
      'color' : friend.color,
      'sex' : friend.sex,
      'description' : friend.description,
      'needs' : friend.needs,
      'images' : getString(friend.images)
    };
  }
}