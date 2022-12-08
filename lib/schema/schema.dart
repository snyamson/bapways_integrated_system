import 'package:realm/realm.dart';

part 'schema.g.dart';

@RealmModel()
class _Officer {
  @PrimaryKey()
  late ObjectId id;
  late String officerId;
  late String name;
  late String phone;
  late String? email;
  late String gender;
  late String location;
  late String levelOfEduc;
  late String dateOfEmployment;
  late DateTime createdAt;

  @override
  String toString() {
    return '{"id": $id, "officerId": $officerId, "name": $name, "phone": $phone, "email": $email, "gender": $gender, "location": $location, "levelOfEduc": $levelOfEduc,"dateOfEmployment":$dateOfEmployment, "createdAt": $createdAt}';
  }
}

@RealmModel()
class _Client {
  @PrimaryKey()
  late ObjectId id;
  late String clientId;
  late String name;
  late String? phone;
  late String gender;
  late String cropType;
  late String? farmSize;
  late String location;
  late String district;
  late String dateOfRegistration;
  late DateTime createdAt;
  late _Officer? officer;

  @override
  String toString() {
    return '{"id": $id, "clientId": $clientId, "name": $name, "phone": $phone, "gender": $gender, "cropType": $cropType, "farmSize": $farmSize, "location": $location,"district":$district,"dateOfRegistration":$dateOfRegistration,"officer":$officer, "createdAt": $createdAt}';
  }
}
