import 'package:hostels/resources/image_resources.dart';

class RoomType {
  const RoomType(
    this.id,
    this.name, {
    this.capcity,
    this.image,
    this.price,
    this.description,
  });
  final int? id;
  final int? capcity;
  final String? name;
  final String? image;
  final double? price;
  final String? description;

  get tag => "roomType#$id";
}

class RoomTypes {
  static const oneInARoom = RoomType(
    1,
    "One in a room",
    image: ImageResources.one,
    price: 5000,
    capcity: 1,
  );
  static const twoInARoom = RoomType(
    2,
    "Two in a room",
    image: ImageResources.two,
    price: 4000,
    capcity: 2,
  );
  static const fourInARoom = RoomType(
    3,
    "Four in a room",
    image: ImageResources.three,
    price: 3000,
    capcity: 4,
  );
  static const sixInARoom = RoomType(
    4,
    "Six in a room",
    image: ImageResources.four,
    price: 2000,
    capcity: 6,
  );
  static const all = [
    oneInARoom,
    twoInARoom,
    fourInARoom,
    sixInARoom,
  ];
}
