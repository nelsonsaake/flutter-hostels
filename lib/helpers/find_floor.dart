import 'package:hostels/archetypes/floors.dart';
import 'package:hostels/data_models/floor.dart';

Floor? findFloor(int? id) {
  if (id == null) return null;

  final ls = Floors.all.where((v) => v.id == id).toList();

  if (ls.isEmpty) return null;

  return ls.first;
}
