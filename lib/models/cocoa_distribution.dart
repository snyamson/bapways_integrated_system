import 'package:realm/realm.dart';
part 'cocoa_distribution.g.dart';

// String cocoaDistributionToJson(CocoaDistribution data) =>
//     json.encode(data.toMap());

@RealmModel()
class _CocoaDistribution {
  @PrimaryKey()
  late ObjectId id;
  late String clientId;
  late String clientName;
  late String kgToCompany;
  late String kgToClient;
  late String totalKg;
  late String dateOfSale;
  late DateTime createdAt;

  @override
  String toString() {
    return '{"id": $id, "clientId": $clientId, "clientName": $clientName, "kgToCompany": $kgToCompany, "kgToClient": $kgToClient, "totalKg": $totalKg, "dateOfSale": $dateOfSale, "createdAt": $createdAt}';
  }
}

// class CocoaDistribution {
//   CocoaDistribution({
//     this.id,
//     required this.clientId,
//     required this.clientName,
//     required this.kgToCompany,
//     required this.kgToClient,
//     required this.totalKg,
//     required this.bags,
//     required this.dateOfSale,
//     this.createdAt,
//   });

//   int? id;
//   String clientId;
//   String clientName;
//   String kgToCompany;
//   String kgToClient;
//   String totalKg;
//   String bags;
//   String dateOfSale;
//   DateTime? createdAt;

//   factory CocoaDistribution.fromJson(String str) =>
//       CocoaDistribution.fromMap(json.decode(str));

//   factory CocoaDistribution.fromMap(Map<String, dynamic> json) =>
//       CocoaDistribution(
//         id: json["id"],
//         clientId: json["clientId"],
//         clientName: json["clientName"],
//         kgToCompany: json["kg_to_company"],
//         kgToClient: json["kg_to_client"],
//         totalKg: json["total_kg"],
//         bags: json["bags"],
//         dateOfSale: json["date_of_sale"],
//         createdAt: DateTime.parse(json["createdAt"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "clientName": clientName,
//         "clientId": clientId,
//         "kg_to_company": kgToCompany,
//         "kg_to_client": kgToClient,
//         "total_kg": totalKg,
//         "bags": bags,
//         "date_of_sale": dateOfSale,
//       };
// }
