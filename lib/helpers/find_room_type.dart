import 'package:hostels/archetypes/room_types.dart';

RoomType? findRoomType(int? id) {
  if (id == null) return null;

  final ls = RoomTypes.all.where((v) => v.id == id).toList();

  if (ls.isEmpty) return null;

  return ls.first;
}
