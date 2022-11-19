// // To parse this JSON data, do
// //
// //     final client = clientFromMap(jsonString);

// import 'package:bapways_integrated_system/models/officer.dart';
// import 'dart:convert';
// //part 'client.g.dart';

// String clientToJson(Client data) => json.encode(data.toMap());

// // @RealmModel()
// // class _Client {
// //   @PrimaryKey()
// //   late ObjectId id;
// //   late int clientId;
// //   late String name;
// //   late String phone;
// //   late String gender;
// //   late String cropType;
// //   late String farmSize;
// //   late String location;
// //   late String district;
// //   late String dateOfRegistration;
// //   late DateTime createdAt;

// //   @Backlink(#clients)
// //   late Iterable<_Officer> linkedOfficer;
// // }

// class Client {
//   Client({
//     this.id,
//     required this.name,
//     required this.phone,
//     required this.gender,
//     required this.cropType,
//     required this.farmSize,
//     required this.location,
//     required this.district,
//     required this.dateOfRegistration,
//     this.createdAt,
//     required this.officerId,
//     this.officerName,
//   });

//   final int? id;
//   final String name;
//   final String phone;
//   final String gender;
//   final String cropType;
//   final String farmSize;
//   final String location;
//   final String district;
//   final String dateOfRegistration;
//   final DateTime? createdAt;
//   final int officerId;
//   final Officer? officerName;

//   factory Client.fromJson(String str) => Client.fromMap(json.decode(str));

//   factory Client.fromMap(Map<String, dynamic> json) => Client(
//         id: json["id"],
//         name: json["name"],
//         phone: json["phone"],
//         gender: json["gender"],
//         cropType: json["crop_type"],
//         farmSize: json["farm_size"],
//         location: json["location"],
//         district: json["district"],
//         dateOfRegistration: json["date_of_registration"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         officerId: json["officerId"],
//         officerName: Officer.fromJson(json["officer_name"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "name": name,
//         "phone": phone,
//         "gender": gender,
//         "crop_type": cropType,
//         "farm_size": farmSize,
//         "location": location,
//         "district": district,
//         "date_of_registration": dateOfRegistration,
//         "officerId": officerId,
//       };
// }
