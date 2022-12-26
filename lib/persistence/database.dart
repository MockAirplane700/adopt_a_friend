import 'package:adopt_a_friend/objects/friend.dart';
import 'package:adopt_a_friend/objects/wish.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static late Database _database;

  static Future getShelters () async {
    return Future(() => {});
  }

  static Future getFriends() async {
    return Future(() => {});
  }

  static Future getCards() async {
    return Future(() => {});
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
    final List<Map<String, dynamic>> maps = await _database.query('wishes');

    return List.generate(maps.length, (index){
      return  Wish(
          id: maps[index]['id'],
          friend: Friend(
              name:maps[index]['name'], breed: maps[index]['breed'],
              species: maps[index]['species'], age: int.parse(maps[index]['age']) ,
              color: maps[index]['color'], sex: maps[index]['sex'],
              description: maps[index]['description'],
              needs: maps[index]['needs'], images: maps[index]['images'])
      );
    }).toList();
  }//end get items

  static Future<void> deleteItem(Wish wish) async {
    await openDb();
    await _database.delete('wishes', where: "name=?", whereArgs: [wish.friend.name]);
  }
}