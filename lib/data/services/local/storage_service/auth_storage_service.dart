import 'package:get_storage/get_storage.dart';

class AuthStorageService {
  final box = GetStorage();

  Future<bool> storeItem({required String key, dynamic value}) async {
    await box.write(key, value);
    return hasData(key: key);
  }

  Future<dynamic> readItem({required String key}) async {
    final value = await box.read(key);
    return value;
  }

  Future<String?> read({required String key}) async {
    final value = await box.read(key);
    return value;
  }

  Future<bool> hasData({required String key}) async {
    final value = box.hasData(key);
    return value;
  }

  deleteItem({required String key}) async {
    await box.remove(key);
  }

  deleteAllItems() async {
    await box.erase();
  }

}

