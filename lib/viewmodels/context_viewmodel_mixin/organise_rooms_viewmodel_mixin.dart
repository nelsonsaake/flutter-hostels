import 'package:hostels/models/floor.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin OrganiseRoomsViewModelMixin on ContextViewModel {
  //...
  // the viewmodel that would this will be mixed with need to implement
  // roos, floors searchText

  List<Room> get rooms;

  List<Floor> get floors;

  List<RoomType> get roomTypes;

  String get searchText;

  Map<Floor, List<Room>> _roomsByFloors = {};

  Map<Floor, List<Room>> get roomsByFloors => _roomsByFloors;

  bool contains(String? a, String? b) {
    //...

    if (a == null || b == null) return false;

    return a.toLowerCase().contains(b.toLowerCase());
  }

  bool isPassed(Room room, String search) {
    //...

    Floor? floor;

    RoomType? roomType;

    if (room.floorId != null) {
      floor = floors.where((f) => f.id == room.floorId).firstOrNull;
    }

    if (room.roomTypeId != null) {
      roomType = roomTypes.where((rt) => rt.id == room.roomTypeId).firstOrNull;
    }

    if (contains(room.number, search)) {
      return true;
    }

    if (contains(floor?.name, search)) {
      return true;
    }

    if (contains(roomType?.name, search)) {
      return true;
    }

    return false;
  }

  List<Room> roomsOnFloor(Floor floor) {
    //...

    List<Room> ls = [];

    for (Room room in rooms) {
      if (room.floorId != floor.id) {
        continue;
      }
      if (isPassed(room, searchText)) {
        ls.add(room);
      }
    }

    return ls;
  }

  Future _organiseRoomsByFloors() async {
    _roomsByFloors = {
      for (Floor floor in floors) floor: roomsOnFloor(floor),
    };
  }

  Future organiseRoomsByFloors() async {
    return runBusyFuture(_organiseRoomsByFloors());
  }
}
