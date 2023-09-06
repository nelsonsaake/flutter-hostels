import 'package:firedart/firedart.dart';
import 'package:hostels/firestore/collections.dart';
import 'package:hostels/models/admin.dart';

class Admins {
  //...

  static CollectionReference get ref {
    return Firestore.instance.collection(FirebaseCollections.admins);
  }

  static Future<Admin> save(Admin v) async {
    //...

    final doc = await ref.add({});

    final id = doc.id;

    final map = v.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return Admin.fromMap(map);
  }

  static Future<List<Admin>> get({int? page}) async {
    //...

    return [for (Document doc in await ref.get()) Admin.fromMap(doc.map)];
  }

  static Future<Admin> find(String id) async {
    //...

    final doc = await ref.document(id).get();

    return Admin.fromMap(doc.map);
  }

  static Future<Admin> update(String id, Admin admin) async {
    //...

    final map = admin.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return admin;
  }

  static Future<bool> exists(String email) async {
    //...

    final admins = await ref.where("email", isEqualTo: email).get();

    return admins.isNotEmpty;
  }

  static Future delete(String email) async {
    //...

    final admins = await ref.where("email", isEqualTo: email).get();

    for (var admin in admins) {
      await admin.reference.delete();
    }
  }

  static Future toggleExists(String email) async {
    //...

    final admins = await ref.where("email", isEqualTo: email).get();

    if (admins.isEmpty) {
      await save(Admin(email: email));
    } else {
      await delete(email);
    }

    return exists(email);
  }
}
