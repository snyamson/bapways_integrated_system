import 'package:realm/realm.dart';
part 'user.g.dart';

@RealmModel()
class _User {
  @PrimaryKey()
  late ObjectId id;
  late String username;
  late String password;
  late String fullName;
  late String email;
  late String position;
  late String role;
  late DateTime createdAt;

  @override
  String toString() {
    return '{"id": $id, "username": $username, "password": $password, "fullName": $fullName, "email": $email, "position": $position, "role": $role,"createdAt": $createdAt}';
  }
}
