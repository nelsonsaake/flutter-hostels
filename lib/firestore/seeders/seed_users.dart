import 'package:hostels/firestore/collections/users.dart';
import 'package:hostels/models/user.dart';

Future seedUsers() async {
  final emails = [
    "nelsonsaakekofi@gmail.com",
    "francisannor@gmail.com",
  ];
  for (var email in emails) {
    await Users.save(AppUser(email: email, isAdmin: true));
  }
}
