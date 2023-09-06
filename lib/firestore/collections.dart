class FirebaseCollections {
  //...
  // static const _prefix = "HostelManagement";
  static const _prefix = "";

  static const admins = "${_prefix}Admins";
  static const floors = "${_prefix}Floors";
  static const roomTypes = "${_prefix}RoomTypes";
  static const rooms = "${_prefix}Rooms";
  static const payments = "${_prefix}Payments";

  static const all = [
    floors,
    roomTypes,
    rooms,
    payments,
  ];
}
