// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class DataStorageService {
//   FlutterSecureStorage storage = const FlutterSecureStorage();
//
//   DataStorageService(){
//     storage = const FlutterSecureStorage();
//   }
//
//   Future<bool> storeItem({required String key, required String value}) async {
//     await storage.write(key: key, value: value);
//
//     final val = await hasData(key: key);
//     return val;
//   }
//
//   Future<String?> readItem({required String key}) async {
//     final value = await storage.read(key: key);
//     return value;
//   }
//
//   Future<Map<String, String>?> readAllItem() async {
//     final value = await storage.readAll();
//     return value;
//   }
//
//   Future<bool> hasData({required String key}) async {
//     final value = storage.containsKey(key: key);
//     return value;
//   }
//
//   deleteItem({required String key}) async {
//     await storage.delete(key: key);
//   }
//
//   deleteAllItems() async {
//     await storage.deleteAll();
//   }
//
// }
//
