import 'package:hostels/archetypes/floors.dart';
import 'package:hostels/archetypes/room_types.dart';
import 'package:hostels/data_models/floor.dart';
import 'package:hostels/data_models/room.dart';
import 'package:hostels/helpers/number_to_letter.dart';

int? randomRoomTypeId() {
  final ls = [...RoomTypes.all];
  return (ls..shuffle()).first.id;
}

Map<Floor, List<Room>> roomsByFloor = {
  for (Floor floor in Floors.all)
    floor: List.generate(
      7,
      (vi) {
        final floorId = (floor.id ?? 1);
        return Room(
          floorId: floorId,
          roomTypeId: randomRoomTypeId(),
          number: "${numberToLetter(floorId)}${vi + 1}",
        );
      },
    ),
};

List<Room> rooms = [
  for (List<Room> v in roomsByFloor.values) ...v,
];
