import 'package:flutter/material.dart';
import 'package:hostels/factory/scaffold_keys.dart';
import 'package:hostels/firestore/collections/rooms.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_floors_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_room_types_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_rooms_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/organise_rooms_viewmodel_mixin.dart';
import 'package:hostels/views/get_delete_confirmation/get_delete_confirmation.dart';
import 'package:hostels/views/room_type_widget_modal/show_room_type_widget_modal.dart';

class RoomsViewModel extends ContextViewModel
    with
        FirebaseAuthViewModelMixin,
        GetRoomTypesViewModelMixin,
        GetFloorsViewModelMixin,
        GetRoomsViewModelMixin,
        OrganiseRoomsViewModelMixin {
  //...

  final searchKey = GlobalKey();

  late TextEditingController search = TextEditingController()
    ..addListener(() => organiseRoomsByFloors());

  @override
  String get searchText => search.text;

  Future _delete(BuildContext context, Room room) async {
    final confirmation = await getDeleteConfirmation(
      ScaffoldKeys.key.currentContext ?? context,
      resource: "Room",
    );
    if (confirmation == true) {
      await Rooms.delete(room.id);
      await getRooms();
      await organiseRoomsByFloors();
    }
  }

  Future delete(BuildContext context, Room room) async {
    await runBusyFuture(_delete(context, room));
  }

  showBuyModal(
    BuildContext context,
    RoomType roomType,
    Room room,
  ) {
    return showRoomTypeWidgetModal(
      context,
      roomType,
    );
  }

  init() async {
    await firestoreinit();
    await getRoomTypes();
    await getFloors();
    await getRooms();
    await organiseRoomsByFloors();
  }
}
