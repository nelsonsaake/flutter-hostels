import 'package:firedart/firedart.dart';
import 'package:hostels/firestore/collections.dart';
import 'package:hostels/models/payment.dart';

class Payments {
  //...

  static CollectionReference get ref {
    return Firestore.instance.collection(FirebaseCollections.payments);
  }

  static Future<Payment> save(Payment v) async {
    //...

    final doc = await ref.add({});

    final id = doc.id;

    final map = v.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return Payment.fromMap(map);
  }

  static Future<List<Payment>> get({int? page}) async {
    return [
      for (Document doc in await ref.get()) Payment.fromMap(doc.map),
    ];
  }

  static Future<Payment> find(String id) async {
    //...

    final doc = await ref.document(id).get();

    return Payment.fromMap(doc.map);
  }

  static Future<Payment> update(String id, Payment payment) async {
    //...

    final map = payment.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return payment;
  }
}
