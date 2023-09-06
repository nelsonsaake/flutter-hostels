import 'package:firedart/firedart.dart';
import 'package:hostels/firestore/collections.dart';
import 'package:hostels/models/floor.dart';

class Floors {
  //...

  static CollectionReference get ref {
    return Firestore.instance.collection(FirebaseCollections.floors);
  }

  static Future<Floor> save(Floor v) async {
    //...

    final doc = await ref.add({});

    final id = doc.id;

    final map = v.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return Floor.fromMap(map);
  }

  static Future<List<Floor>> get({int? page}) async {
    //...

    return [for (Document doc in await ref.get()) Floor.fromMap(doc.map)];
  }

  static Future<Floor> find(String id) async {
    //...

    final doc = await ref.document(id).get();

    return Floor.fromMap(doc.map);
  }

  static Future<Floor> update(String id, Floor floor) async {
    //...

    final map = floor.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return floor;
  }
}
