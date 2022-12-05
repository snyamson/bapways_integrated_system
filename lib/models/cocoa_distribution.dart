import 'package:realm/realm.dart';
part 'cocoa_distribution.g.dart';

@RealmModel()
class _CocoaDistribution {
  @PrimaryKey()
  late ObjectId id;
  late String clientId;
  late String clientName;
  late String kgToCompany;
  late String kgToClient;
  late String dateOfSale;
  late DateTime createdAt;

  @override
  String toString() {
    return '{"id": $id, "clientId": $clientId, "clientName": $clientName, "kgToCompany": $kgToCompany, "kgToClient": $kgToClient, "dateOfSale": $dateOfSale, "createdAt": $createdAt}';
  }
}
