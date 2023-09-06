import 'package:firedart/firedart.dart';
import 'package:hostels/firestore/collections.dart';
import 'package:hostels/models/room.dart';

class Rooms {
  //...

  static CollectionReference get ref {
    return Firestore.instance.collection(FirebaseCollections.rooms);
  }

  static Future<Room> save(Room v) async {
    //...

    final doc = await ref.add({});

    final id = doc.id;

    final map = v.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return Room.fromMap(map);
  }

  static Future<List<Room>> get({int? page}) async {
    return [
      for (Document doc in await ref.get()) Room.fromMap(doc.map),
    ];
  }

  static Future<Room> find(String id) async {
    //...

    final doc = await ref.document(id).get();

    return Room.fromMap(doc.map);
  }

  static Future<Room> update(String id, Room room) async {
    //...

    final map = room.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return room;
  }

  // static Future<List<Room>> where() async {}
}
