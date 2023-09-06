import 'package:hostels/firestore/seeders/seed_admins.dart';
import 'package:hostels/firestore/seeders/seed_floors.dart';
import 'package:hostels/firestore/seeders/seed_room_types.dart';
import 'package:hostels/firestore/seeders/seed_rooms.dart';

Future seed() async {
  await seedAdmins();
  await seedFloors();
  await seedRoomTypes();
  await seedRooms();
}
