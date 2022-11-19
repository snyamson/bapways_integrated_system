// // To parse this JSON data, do
// //
// //     final contact = contactFromJson(jsonString);

// import 'dart:convert';

// //part 'officer.g.dart';

// Officer officerFromJson(String str) => Officer.fromJson(json.decode(str));

// String officerToJson(Officer data) => json.encode(data.toJson());

// // @RealmModel()
// // class _Officer {
// //   @PrimaryKey()
// //   late ObjectId id;
// //   late int officerId;
// //   late String name;
// //   late String phone;
// //   late String email;
// //   late String gender;
// //   late String location;
// //   late String levelOfEduc;
// //   late String dateOfEmployment;
// //   late DateTime createdAt;
// //   // late List<_Client> clients;
// // }

// class Officer {
//   Officer({
//     this.id,
//     required this.name,
//     required this.phone,
//     required this.email,
//     required this.gender,
//     required this.location,
//     required this.levelOfEduc,
//     required this.dateOfEmployment,
//     this.role,
//     this.createdAt,
//   });

//   int? id;
//   String name;
//   String phone;
//   String email;
//   String gender;
//   String location;
//   String levelOfEduc;
//   String dateOfEmployment;
//   String? role;
//   DateTime? createdAt;

//   factory Officer.fromJson(Map<String, dynamic> json) => Officer(
//         id: json["id"],
//         name: json["name"],
//         phone: json["phone"],
//         email: json["email"],
//         gender: json["gender"],
//         location: json["location"],
//         levelOfEduc: json["level_of_educ"],
//         dateOfEmployment: json["date_of_employment"],
//         role: json["role"],
//         createdAt: DateTime.parse(json["createdAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "phone": phone,
//         "email": email,
//         "gender": gender,
//         "location": location,
//         "level_of_educ": levelOfEduc,
//         "date_of_employment": dateOfEmployment,
//       };
// }
