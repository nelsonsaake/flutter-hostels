import 'package:hostels/data_models/floor.dart';
import 'package:hostels/data_models/room.dart';
import 'package:hostels/helpers/find_floor.dart';
import 'package:hostels/helpers/find_room_type.dart';

bool contains(String? s, String? sub) {
  if (s == null || sub == null) return false;
  return s.toLowerCase().contains(sub.toLowerCase());
}

bool passfilter(Room room, String filter) {
  for (var v in [
    // match room number
    contains(room.number, filter),
    // match room type name
    contains(findRoomType(room.roomTypeId)?.name, filter),
    // match floor
    contains(findFloor(room.roomTypeId)?.name, filter),
  ]) {
    if (v) return true;
  }
  return false;
}

Map<Floor, List<Room>> filter(Map<Floor, List<Room>> v, filter) {
  return v.map(
    (floor, rooms) => MapEntry(
      floor,
      rooms
          .where(
            (room) => passfilter(room, filter),
          )
          .toList(),
    ),
  )..removeWhere(
      (floor, rooms) => rooms.isEmpty,
    );
}
