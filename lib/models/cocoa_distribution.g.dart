// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocoa_distribution.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class CocoaDistribution extends _CocoaDistribution
    with RealmEntity, RealmObject {
  CocoaDistribution(
    ObjectId id,
    String clientId,
    String clientName,
    String kgToCompany,
    String kgToClient,
    String totalKg,
    String bags,
    String dateOfSale,
    DateTime createdAt,
  ) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'clientId', clientId);
    RealmObject.set(this, 'clientName', clientName);
    RealmObject.set(this, 'kgToCompany', kgToCompany);
    RealmObject.set(this, 'kgToClient', kgToClient);
    RealmObject.set(this, 'totalKg', totalKg);
    RealmObject.set(this, 'bags', bags);
    RealmObject.set(this, 'dateOfSale', dateOfSale);
    RealmObject.set(this, 'createdAt', createdAt);
  }

  CocoaDistribution._();

  @override
  ObjectId get id => RealmObject.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObject.set(this, 'id', value);

  @override
  String get clientId => RealmObject.get<String>(this, 'clientId') as String;
  @override
  set clientId(String value) => RealmObject.set(this, 'clientId', value);

  @override
  String get clientName =>
      RealmObject.get<String>(this, 'clientName') as String;
  @override
  set clientName(String value) => RealmObject.set(this, 'clientName', value);

  @override
  String get kgToCompany =>
      RealmObject.get<String>(this, 'kgToCompany') as String;
  @override
  set kgToCompany(String value) => RealmObject.set(this, 'kgToCompany', value);

  @override
  String get kgToClient =>
      RealmObject.get<String>(this, 'kgToClient') as String;
  @override
  set kgToClient(String value) => RealmObject.set(this, 'kgToClient', value);

  @override
  String get totalKg => RealmObject.get<String>(this, 'totalKg') as String;
  @override
  set totalKg(String value) => RealmObject.set(this, 'totalKg', value);

  @override
  String get bags => RealmObject.get<String>(this, 'bags') as String;
  @override
  set bags(String value) => RealmObject.set(this, 'bags', value);

  @override
  String get dateOfSale =>
      RealmObject.get<String>(this, 'dateOfSale') as String;
  @override
  set dateOfSale(String value) => RealmObject.set(this, 'dateOfSale', value);

  @override
  DateTime get createdAt =>
      RealmObject.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) => RealmObject.set(this, 'createdAt', value);

  @override
  Stream<RealmObjectChanges<CocoaDistribution>> get changes =>
      RealmObject.getChanges<CocoaDistribution>(this);

  @override
  CocoaDistribution freeze() =>
      RealmObject.freezeObject<CocoaDistribution>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(CocoaDistribution._);
    return const SchemaObject(CocoaDistribution, 'CocoaDistribution', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('clientId', RealmPropertyType.string),
      SchemaProperty('clientName', RealmPropertyType.string),
      SchemaProperty('kgToCompany', RealmPropertyType.string),
      SchemaProperty('kgToClient', RealmPropertyType.string),
      SchemaProperty('totalKg', RealmPropertyType.string),
      SchemaProperty('bags', RealmPropertyType.string),
      SchemaProperty('dateOfSale', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
    ]);
  }
}
