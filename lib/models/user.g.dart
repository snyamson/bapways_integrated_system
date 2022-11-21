// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class User extends _User with RealmEntity, RealmObject {
  User(
    ObjectId id,
    String username,
    String password,
    String fullName,
    String email,
    String position,
    String role,
    DateTime createdAt,
  ) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'username', username);
    RealmObject.set(this, 'password', password);
    RealmObject.set(this, 'fullName', fullName);
    RealmObject.set(this, 'email', email);
    RealmObject.set(this, 'position', position);
    RealmObject.set(this, 'role', role);
    RealmObject.set(this, 'createdAt', createdAt);
  }

  User._();

  @override
  ObjectId get id => RealmObject.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObject.set(this, 'id', value);

  @override
  String get username => RealmObject.get<String>(this, 'username') as String;
  @override
  set username(String value) => RealmObject.set(this, 'username', value);

  @override
  String get password => RealmObject.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObject.set(this, 'password', value);

  @override
  String get fullName => RealmObject.get<String>(this, 'fullName') as String;
  @override
  set fullName(String value) => RealmObject.set(this, 'fullName', value);

  @override
  String get email => RealmObject.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObject.set(this, 'email', value);

  @override
  String get position => RealmObject.get<String>(this, 'position') as String;
  @override
  set position(String value) => RealmObject.set(this, 'position', value);

  @override
  String get role => RealmObject.get<String>(this, 'role') as String;
  @override
  set role(String value) => RealmObject.set(this, 'role', value);

  @override
  DateTime get createdAt =>
      RealmObject.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) => RealmObject.set(this, 'createdAt', value);

  @override
  Stream<RealmObjectChanges<User>> get changes =>
      RealmObject.getChanges<User>(this);

  @override
  User freeze() => RealmObject.freezeObject<User>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(User._);
    return const SchemaObject(User, 'User', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('username', RealmPropertyType.string),
      SchemaProperty('password', RealmPropertyType.string),
      SchemaProperty('fullName', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('position', RealmPropertyType.string),
      SchemaProperty('role', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
    ]);
  }
}
