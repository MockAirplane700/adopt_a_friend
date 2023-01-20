import 'package:adopt_a_friend/objects/friend.dart';
import 'package:adopt_a_friend/objects/info_card.dart';
import 'package:adopt_a_friend/objects/shelter.dart';
import 'package:adopt_a_friend/objects/wish.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static late Database _database;


  static Future getShelters () async {
    return Future(() => {
      Shelter(
          name: 'Winnipeg Pet Rescue Shelter',
          description: 'The Winnipeg Pet Rescue Shelter is Manitoba’s first registered charity, NO-KILL animal shelter.\nOur Mission: The Winnipeg Pet Rescue Shelter is a non-profit charity committed to providing a euthanasia-free environment for unwanted animals through the provision of interim care and arrangement of adoptions to suitable owners.\nOur Vision: The Winnipeg Pet Rescue Shelter aspires to a society in which pets are accorded the right to life and are recognized as beings with feelings that have the right to loving care.',
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/rescue.jpeg?alt=media&token=ae8bf3c4-a367-425d-a29e-caf1818af15b', address: '12-2727 Portage Avenue, Winnipeg',
          website: 'https://petrescueshelter.com/about-us/', email: 'info@wpgpet.ca', facebook: 'https://www.facebook.com',
          twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com') ,
      Shelter(
          name: 'Winnipeg Pet Rescue Shelter',
          description: 'The Winnipeg Pet Rescue Shelter is Manitoba’s first registered charity, NO-KILL animal shelter.\nOur Mission: The Winnipeg Pet Rescue Shelter is a non-profit charity committed to providing a euthanasia-free environment for unwanted animals through the provision of interim care and arrangement of adoptions to suitable owners.\nOur Vision: The Winnipeg Pet Rescue Shelter aspires to a society in which pets are accorded the right to life and are recognized as beings with feelings that have the right to loving care.',
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/rescue.jpeg?alt=media&token=ae8bf3c4-a367-425d-a29e-caf1818af15b', address: '12-2727 Portage Avenue, Winnipeg',
          website: 'https://petrescueshelter.com/about-us/', email: 'info@wpgpet.ca', facebook: 'https://www.facebook.com',
          twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com') ,
      Shelter(
          name: 'Winnipeg Pet Rescue Shelter',
          description: 'The Winnipeg Pet Rescue Shelter is Manitoba’s first registered charity, NO-KILL animal shelter.\nOur Mission: The Winnipeg Pet Rescue Shelter is a non-profit charity committed to providing a euthanasia-free environment for unwanted animals through the provision of interim care and arrangement of adoptions to suitable owners.\nOur Vision: The Winnipeg Pet Rescue Shelter aspires to a society in which pets are accorded the right to life and are recognized as beings with feelings that have the right to loving care.',
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/rescue.jpeg?alt=media&token=ae8bf3c4-a367-425d-a29e-caf1818af15b', address: '12-2727 Portage Avenue, Winnipeg',
          website: 'https://petrescueshelter.com/about-us/', email: 'info@wpgpet.ca', facebook: 'https://www.facebook.com',
          twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com') ,
      Shelter(
          name: 'Winnipeg Pet Rescue Shelter',
          description: 'The Winnipeg Pet Rescue Shelter is Manitoba’s first registered charity, NO-KILL animal shelter.\nOur Mission: The Winnipeg Pet Rescue Shelter is a non-profit charity committed to providing a euthanasia-free environment for unwanted animals through the provision of interim care and arrangement of adoptions to suitable owners.\nOur Vision: The Winnipeg Pet Rescue Shelter aspires to a society in which pets are accorded the right to life and are recognized as beings with feelings that have the right to loving care.',
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/rescue.jpeg?alt=media&token=ae8bf3c4-a367-425d-a29e-caf1818af15b', address: '12-2727 Portage Avenue, Winnipeg',
          website: 'https://petrescueshelter.com/about-us/', email: 'info@wpgpet.ca', facebook: 'https://www.facebook.com',
          twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com') ,
    });
  }

  static Future getFriends() async {
    return Future(() => {
      Friend(
          name: 'Scooty', breed: 'Husky X',
          species: 'Dog', age: 1, color: 'Brown',
          sex: 'female', description: 'House trained: no\nSize: Large\nVaccination: pending',
          needs: 'Personality, good with everyone, \n\nNot suitable for apartments', images: [
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185',
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185'
      ], email: 'mthandazo99@gmail.com', link: 'https://winnipeghumanesociety.ca/adoptable-animals/?sb_page=1&sb_animal_id=451317') ,
      Friend(
          name: 'Scooty', breed: 'Husky X',
          species: 'Dog', age: 1, color: 'Brown',
          sex: 'female', description: 'House trained: no\nSize: Large\nVaccination: pending',
          needs: 'Personality, good with everyone, \n\nNot suitable for apartments', images: [
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185',
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185'
      ], email: 'mthandazo99@gmail.com', link: 'https://winnipeghumanesociety.ca/adoptable-animals/?sb_page=1&sb_animal_id=451317') ,
      Friend(
          name: 'Scooty', breed: 'Husky X',
          species: 'Dog', age: 1, color: 'Brown',
          sex: 'female', description: 'House trained: no\nSize: Large\nVaccination: pending',
          needs: 'Personality, good with everyone, \n\nNot suitable for apartments', images: [
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185',
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185'
      ], email: 'mthandazo99@gmail.com', link: 'https://winnipeghumanesociety.ca/adoptable-animals/?sb_page=1&sb_animal_id=451317') ,
      Friend(
          name: 'Scooty', breed: 'Husky X',
          species: 'Dog', age: 1, color: 'Brown',
          sex: 'female', description: 'House trained: no\nSize: Large\nVaccination: pending',
          needs: 'Personality, good with everyone, \n\nNot suitable for apartments', images: [
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185',
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185'
      ], email: 'mthandazo99@gmail.com', link: 'https://winnipeghumanesociety.ca/adoptable-animals/?sb_page=1&sb_animal_id=451317') ,
      Friend(
          name: 'Scooty', breed: 'Husky X',
          species: 'Dog', age: 1, color: 'Brown',
          sex: 'female', description: 'House trained: no\nSize: Large\nVaccination: pending',
          needs: 'Personality, good with everyone, \n\nNot suitable for apartments', images: [
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185',
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185'
      ], email: 'mthandazo99@gmail.com', link: 'https://winnipeghumanesociety.ca/adoptable-animals/?sb_page=1&sb_animal_id=451317') ,
      Friend(
          name: 'Scooty', breed: 'Husky X',
          species: 'Dog', age: 1, color: 'Brown',
          sex: 'female', description: 'House trained: no\nSize: Large\nVaccination: pending',
          needs: 'Personality, good with everyone, \n\nNot suitable for apartments', images: [
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185',
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185'
      ], email: 'mthandazo99@gmail.com', link: 'https://winnipeghumanesociety.ca/adoptable-animals/?sb_page=1&sb_animal_id=451317') ,
      Friend(
          name: 'Scooty', breed: 'Husky X',
          species: 'Dog', age: 1, color: 'Brown',
          sex: 'female', description: 'House trained: no\nSize: Large\nVaccination: pending',
          needs: 'Personality, good with everyone, \n\nNot suitable for apartments', images: [
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185',
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185'
      ], email: 'mthandazo99@gmail.com', link: 'https://winnipeghumanesociety.ca/adoptable-animals/?sb_page=1&sb_animal_id=451317') ,
      Friend(
          name: 'Scooty', breed: 'Husky X',
          species: 'Dog', age: 1, color: 'Brown',
          sex: 'female', description: 'House trained: no\nSize: Large\nVaccination: pending',
          needs: 'Personality, good with everyone, \n\nNot suitable for apartments', images: [
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185',
        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/scooty.jpeg?alt=media&token=56d8811e-5257-48fa-b7ca-798e11659185'
      ], email: 'mthandazo99@gmail.com', link: 'https://winnipeghumanesociety.ca/adoptable-animals/?sb_page=1&sb_animal_id=451317') ,
    });
  }

  static Future getCards() async {
    return Future(() => {
      InfoCard(
          species: 'Cat', breed: 'persian',
          instructions: 'Provide plenty of human companionship\nProvide regular, suitable meals with a constant supply of fresh water\nProvide a clean and comfortable bed\nProvide the cat with outdoor access or be prepared to empty and clean a litter tray on a daily basis\nProvide it with a stimulating and safe environment\nGroom it regularly. Longhaired cats require daily grooming\nHave it neutered between 4 and 6 months old\nVaccinate against the major feline diseases regularly\nWorm regularly and provide treatment for fleas\nTake the cat to the vet when it shows any sign of illness\nInsure your cat or make sure you can afford the cost of any veterinary treatment it may need',
          health: 'Vomiting, Feline lower urinary tract disease,fleas,Tapeworms',
          activity: 'Cats are crepuscular, which means they are most active at dawn and dusk. ',
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/cat.jpeg?alt=media&token=99496f88-20da-4363-bfc0-b4dafd8af58c' ) ,
      InfoCard(
          species: 'Cat', breed: 'persian',
          instructions: 'Provide plenty of human companionship\nProvide regular, suitable meals with a constant supply of fresh water\nProvide a clean and comfortable bed\nProvide the cat with outdoor access or be prepared to empty and clean a litter tray on a daily basis\nProvide it with a stimulating and safe environment\nGroom it regularly. Longhaired cats require daily grooming\nHave it neutered between 4 and 6 months old\nVaccinate against the major feline diseases regularly\nWorm regularly and provide treatment for fleas\nTake the cat to the vet when it shows any sign of illness\nInsure your cat or make sure you can afford the cost of any veterinary treatment it may need',
          health: 'Vomiting, Feline lower urinary tract disease,fleas,Tapeworms',
          activity: 'Cats are crepuscular, which means they are most active at dawn and dusk. ',
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/cat.jpeg?alt=media&token=99496f88-20da-4363-bfc0-b4dafd8af58c' ) ,
      InfoCard(
          species: 'Cat', breed: 'persian',
          instructions: 'Provide plenty of human companionship\nProvide regular, suitable meals with a constant supply of fresh water\nProvide a clean and comfortable bed\nProvide the cat with outdoor access or be prepared to empty and clean a litter tray on a daily basis\nProvide it with a stimulating and safe environment\nGroom it regularly. Longhaired cats require daily grooming\nHave it neutered between 4 and 6 months old\nVaccinate against the major feline diseases regularly\nWorm regularly and provide treatment for fleas\nTake the cat to the vet when it shows any sign of illness\nInsure your cat or make sure you can afford the cost of any veterinary treatment it may need',
          health: 'Vomiting, Feline lower urinary tract disease,fleas,Tapeworms',
          activity: 'Cats are crepuscular, which means they are most active at dawn and dusk. ',
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/cat.jpeg?alt=media&token=99496f88-20da-4363-bfc0-b4dafd8af58c' ) ,
      InfoCard(
          species: 'Cat', breed: 'persian',
          instructions: 'Provide plenty of human companionship\nProvide regular, suitable meals with a constant supply of fresh water\nProvide a clean and comfortable bed\nProvide the cat with outdoor access or be prepared to empty and clean a litter tray on a daily basis\nProvide it with a stimulating and safe environment\nGroom it regularly. Longhaired cats require daily grooming\nHave it neutered between 4 and 6 months old\nVaccinate against the major feline diseases regularly\nWorm regularly and provide treatment for fleas\nTake the cat to the vet when it shows any sign of illness\nInsure your cat or make sure you can afford the cost of any veterinary treatment it may need',
          health: 'Vomiting, Feline lower urinary tract disease,fleas,Tapeworms',
          activity: 'Cats are crepuscular, which means they are most active at dawn and dusk. ',
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/cat.jpeg?alt=media&token=99496f88-20da-4363-bfc0-b4dafd8af58c' ) ,
    });
  }


  ///===========================================================================
///
///
///  SQL
///   'id' : id,
//       'name' : friend.name,
//       'breed' : friend.breed,
//       'species' : friend.species,
//       'age' : friend.age,
//       'color' : friend.color,
//       'sex' : friend.sex,
//       'description' : friend.description,
//       'needs' : friend.needs,
//       'images' : getString(friend.images)
///
/// ============================================================================

  static Future openDb() async {
    _database = await openDatabase(
        join(await getDatabasesPath(), "wishList.ddb"),
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE wishes("
                  "id INTEGER PRIMARY KEY autoincrement, "
                  "name TEXT,breed TEXT, species TEXT,"
                  "age INTEGER, color TEXT, sex TEXT,"
                  "description TEXT, needs TEXT, images TEXT"
                  ")"
          );
        }
    );
    return _database;
  }//end open DB

  static Future insertItem(Wish wish) async{
    await openDb();
    try {
      return await _database.insert('wishes', wish.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }catch (error) {
      throw Exception(error.toString());
    }//end try-catch
  }//end insert item

  static Future<List<Wish>> getItems() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('wishes');

    return List.generate(maps.length, (index){
      return  Wish(
          id: maps[index]['id'],
          friend: Friend(
              name:maps[index]['name'], breed: maps[index]['breed'],
              species: maps[index]['species'], age: int.parse(maps[index]['age']) ,
              color: maps[index]['color'], sex: maps[index]['sex'],
              description: maps[index]['description'],
              needs: maps[index]['needs'], images: maps[index]['images'], email: maps[index]['email'] ?? '', link:maps[index]['link'] ?? 'https://www.sizibamthandazo.dev')
      );
    }).toList();
  }//end get items

  static Future<void> deleteItem(Wish wish) async {
    await openDb();
    await _database.delete('wishes', where: "name=?", whereArgs: [wish.friend.name]);
  }
}