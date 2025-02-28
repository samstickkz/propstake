import 'package:propstake/ui/base/base-vm.dart';

class SettingsViewModel extends BaseViewModel {

  bool isActive = false;

  changeValue(bool value) {
    isActive = value;
    notifyListeners();
  }

  Future<bool> getFuture() async {
    await Future.delayed(const Duration(microseconds: 10));
    return !isActive;
  }

}