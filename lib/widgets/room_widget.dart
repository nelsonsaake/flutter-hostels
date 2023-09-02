import 'package:flutter/material.dart';
import 'package:hostels/data_models/room.dart';
import 'package:hostels/helpers/find_floor.dart';
import 'package:hostels/helpers/find_room_type.dart';
import 'package:hostels/helpers/format_capacity.dart';
import 'package:hostels/helpers/format_price.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/paystack/service/paystack_service.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget(this.room, {super.key});

  final Room room;

  String get roomNumber => room.number ?? "";

  String get floorName => findFloor(room.floorId)?.name ?? "";

  String get roomType => findRoomType(room.roomTypeId)?.name ?? "";

  String get price => formatPrice(findRoomType(room.roomTypeId)?.price);

  String get capacity => formatCapacity(findRoomType(room.roomTypeId)?.capcity);

  @override
  Widget build(BuildContext context) {
    return Card(
      //...

      elevation: 2,

      clipBehavior: Clip.antiAlias,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: GestureDetector(
        onTap: () => PaystackService.showModal(context),
        child: Container(
          height: 150,
          width: double.maxFinite,
          padding: const EdgeInsets.all(16.0).copyWith(left: 20),
          decoration: BoxDecoration(
            gradient: ColorResources.backgroundGradient2,
          ),
          child: Stack(
            children: [
              //...
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      roomNumber,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$floorName, $roomType",
                    ),
                    Text(
                      capacity,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                right: 5,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      price,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
