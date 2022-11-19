import 'package:bapways_integrated_system/models/cocoa_distribution.dart';
import 'package:bapways_integrated_system/schema/schema.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:realm/realm.dart';

class DbHelper {
  static Realm? db;

  static Future<void> initDb() async {
    if (db != null) {
      return;
    }
    try {
      Configuration configuration = Configuration.local([
        CocoaDistribution.schema,
        Officer.schema,
        Client.schema,
      ]);
      debugPrint('initializing db');
      db = Realm(configuration);
    } catch (e) {
      debugPrint('Printing error from init: ${e.toString()}');
    }
  }

// COCOA DISTRIBUTION HELPERS
  static Future<void> insertCocoaData({cocoaData}) async {
    return db?.write(() => db?.add<CocoaDistribution>(cocoaData));
  }

  static Future<List<CocoaDistribution>?> getAllCocoaData() async {
    return db?.all<CocoaDistribution>().toList();
  }

  static Future<void> updateCocoaData({cocoaData}) async {
    return db?.write(
      () => db?.add<CocoaDistribution>(cocoaData, update: true),
    );
  }

  static Future<void> deleteAll() async {
    return db?.write(() => db?.deleteAll<CocoaDistribution>());
  }

  // OFFICER HELPERS
  static Future<void> insertOfficerData({required Officer officerData}) async {
    return db?.write(() => db?.add<Officer>(officerData));
  }

  static Future<List<Officer>?> getAllOfficerData() async {
    return db?.all<Officer>().toList();
  }

  static Future<void> updateOfficerData({officerData}) async {
    return db?.write(
      () => db?.add<Officer>(officerData, update: true),
    );
  }

  static Future<void> deleteAllOfficerData() async {
    return db?.write(() => db?.deleteAll<Officer>());
  }

  // CLIENT HELPERS
  static Future<void> insertClientData({required Client clientData}) async {
    return db?.write(() => db?.add<Client>(clientData));
  }

  static Future<List<Client>?> getAllClientData() async {
    return db?.all<Client>().toList();
  }

  static Future<void> updateClientData({required Client clientData}) async {
    return db?.write(
      () => db?.add<Client>(clientData, update: true),
    );
  }

  static Future<void> deleteAllClientData() async {
    return db?.write(() => db?.deleteAll<Client>());
  }
}
