import 'package:hostels/firestore/collections/admins.dart';
import 'package:hostels/models/admin.dart';

Future seedAdmins() async {
  final emails = [
    "nelsonsaakekofi@gmail.com",
    "francisannor@gmail.com",
  ];
  for (var email in emails) {
    await Admins.save(Admin(email: email));
  }
}
