import 'package:hostels/data_models/floor.dart';

class Floors {
  //...
  static const groundFloor = Floor(
    1,
    "Ground Floor",
  );
  static const firstFloor = Floor(
    2,
    "First Floor",
  );
  static const secondFloor = Floor(
    3,
    "Second Floor",
  );
  static const all = [
    groundFloor,
    firstFloor,
    secondFloor,
  ];
}
