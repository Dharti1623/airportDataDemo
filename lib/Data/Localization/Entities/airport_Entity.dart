import 'package:isar/isar.dart';

part 'airport_Entity.g.dart';

@Collection()
class AirportEntities{
  Id id = Isar.autoIncrement;
  String? icao;
  String? iata;
  String? name;
  String? city;
  String? state;
  String? country;
   double? elevation;
  double? lat;
  double? lon;
  String? tz;
}



// import 'package:isar/isar.dart';
//
// part 'airport_Entity.g.dart';
//
// @Collection()
// class AirportEntities{
//   Id id = Isar.autoIncrement;
//   late String userEmail;
//   late String userToken;
// }
