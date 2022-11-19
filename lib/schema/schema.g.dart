// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Officer extends _Officer with RealmEntity, RealmObject {
  Officer(
    ObjectId id,
    int officerId,
    String name,
    String phone,
    String email,
    String gender,
    String location,
    String levelOfEduc,
    String dateOfEmployment,
    DateTime createdAt,
  ) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'officerId', officerId);
    RealmObject.set(this, 'name', name);
    RealmObject.set(this, 'phone', phone);
    RealmObject.set(this, 'email', email);
    RealmObject.set(this, 'gender', gender);
    RealmObject.set(this, 'location', location);
    RealmObject.set(this, 'levelOfEduc', levelOfEduc);
    RealmObject.set(this, 'dateOfEmployment', dateOfEmployment);
    RealmObject.set(this, 'createdAt', createdAt);
  }

  Officer._();

  @override
  ObjectId get id => RealmObject.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObject.set(this, 'id', value);

  @override
  int get officerId => RealmObject.get<int>(this, 'officerId') as int;
  @override
  set officerId(int value) => RealmObject.set(this, 'officerId', value);

  @override
  String get name => RealmObject.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObject.set(this, 'name', value);

  @override
  String get phone => RealmObject.get<String>(this, 'phone') as String;
  @override
  set phone(String value) => RealmObject.set(this, 'phone', value);

  @override
  String get email => RealmObject.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObject.set(this, 'email', value);

  @override
  String get gender => RealmObject.get<String>(this, 'gender') as String;
  @override
  set gender(String value) => RealmObject.set(this, 'gender', value);

  @override
  String get location => RealmObject.get<String>(this, 'location') as String;
  @override
  set location(String value) => RealmObject.set(this, 'location', value);

  @override
  String get levelOfEduc =>
      RealmObject.get<String>(this, 'levelOfEduc') as String;
  @override
  set levelOfEduc(String value) => RealmObject.set(this, 'levelOfEduc', value);

  @override
  String get dateOfEmployment =>
      RealmObject.get<String>(this, 'dateOfEmployment') as String;
  @override
  set dateOfEmployment(String value) =>
      RealmObject.set(this, 'dateOfEmployment', value);

  @override
  DateTime get createdAt =>
      RealmObject.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) => RealmObject.set(this, 'createdAt', value);

  @override
  Stream<RealmObjectChanges<Officer>> get changes =>
      RealmObject.getChanges<Officer>(this);

  @override
  Officer freeze() => RealmObject.freezeObject<Officer>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Officer._);
    return const SchemaObject(Officer, 'Officer', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('officerId', RealmPropertyType.int),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('phone', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('gender', RealmPropertyType.string),
      SchemaProperty('location', RealmPropertyType.string),
      SchemaProperty('levelOfEduc', RealmPropertyType.string),
      SchemaProperty('dateOfEmployment', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
    ]);
  }
}

class Client extends _Client with RealmEntity, RealmObject {
  Client(
    ObjectId id,
    int clientId,
    String name,
    String phone,
    String gender,
    String cropType,
    String farmSize,
    String location,
    String district,
    String dateOfRegistration,
    DateTime createdAt, {
    Officer? officer,
  }) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'clientId', clientId);
    RealmObject.set(this, 'name', name);
    RealmObject.set(this, 'phone', phone);
    RealmObject.set(this, 'gender', gender);
    RealmObject.set(this, 'cropType', cropType);
    RealmObject.set(this, 'farmSize', farmSize);
    RealmObject.set(this, 'location', location);
    RealmObject.set(this, 'district', district);
    RealmObject.set(this, 'dateOfRegistration', dateOfRegistration);
    RealmObject.set(this, 'createdAt', createdAt);
    RealmObject.set(this, 'officer', officer);
  }

  Client._();

  @override
  ObjectId get id => RealmObject.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObject.set(this, 'id', value);

  @override
  int get clientId => RealmObject.get<int>(this, 'clientId') as int;
  @override
  set clientId(int value) => RealmObject.set(this, 'clientId', value);

  @override
  String get name => RealmObject.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObject.set(this, 'name', value);

  @override
  String get phone => RealmObject.get<String>(this, 'phone') as String;
  @override
  set phone(String value) => RealmObject.set(this, 'phone', value);

  @override
  String get gender => RealmObject.get<String>(this, 'gender') as String;
  @override
  set gender(String value) => RealmObject.set(this, 'gender', value);

  @override
  String get cropType => RealmObject.get<String>(this, 'cropType') as String;
  @override
  set cropType(String value) => RealmObject.set(this, 'cropType', value);

  @override
  String get farmSize => RealmObject.get<String>(this, 'farmSize') as String;
  @override
  set farmSize(String value) => RealmObject.set(this, 'farmSize', value);

  @override
  String get location => RealmObject.get<String>(this, 'location') as String;
  @override
  set location(String value) => RealmObject.set(this, 'location', value);

  @override
  String get district => RealmObject.get<String>(this, 'district') as String;
  @override
  set district(String value) => RealmObject.set(this, 'district', value);

  @override
  String get dateOfRegistration =>
      RealmObject.get<String>(this, 'dateOfRegistration') as String;
  @override
  set dateOfRegistration(String value) =>
      RealmObject.set(this, 'dateOfRegistration', value);

  @override
  DateTime get createdAt =>
      RealmObject.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) => RealmObject.set(this, 'createdAt', value);

  @override
  Officer? get officer => RealmObject.get<Officer>(this, 'officer') as Officer?;
  @override
  set officer(covariant Officer? value) =>
      RealmObject.set(this, 'officer', value);

  @override
  Stream<RealmObjectChanges<Client>> get changes =>
      RealmObject.getChanges<Client>(this);

  @override
  Client freeze() => RealmObject.freezeObject<Client>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Client._);
    return const SchemaObject(Client, 'Client', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('clientId', RealmPropertyType.int),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('phone', RealmPropertyType.string),
      SchemaProperty('gender', RealmPropertyType.string),
      SchemaProperty('cropType', RealmPropertyType.string),
      SchemaProperty('farmSize', RealmPropertyType.string),
      SchemaProperty('location', RealmPropertyType.string),
      SchemaProperty('district', RealmPropertyType.string),
      SchemaProperty('dateOfRegistration', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('officer', RealmPropertyType.object,
          optional: true, linkTarget: 'Officer'),
    ]);
  }
}
