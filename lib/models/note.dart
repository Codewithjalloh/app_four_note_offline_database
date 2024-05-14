// this line is needed to generate file
// then run dart run build_runner build
import 'package:isar/isar.dart';

part "note.g.dart";

@collection
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}
