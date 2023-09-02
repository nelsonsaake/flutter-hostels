import 'package:flutter/material.dart';
import 'package:hostels/archetypes/room_types.dart';
import 'package:hostels/resources/color_resources.dart';

class RoomTypeWidget extends StatelessWidget {
  const RoomTypeWidget(
    this.roomType, {
    super.key,
    this.height,
    this.width,
  });

  final RoomType roomType;
  final double? width;
  final double? height;

  String get image => roomType.image ?? "";

  String get label => [
        roomType.name ?? "",
        // formatPrice(roomType.price),
      ].join("\n");

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: roomType.tag,
      child: Card(
        //...

        color: ColorResources.dark,

        elevation: 2,

        clipBehavior: Clip.hardEdge,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        child: Container(
          height: height,
          width: width,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: ColorResources.dark,
            width: double.maxFinite,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
