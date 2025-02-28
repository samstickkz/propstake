import 'package:propstake/ui/base/base-vm.dart';

class SettingsViewModel extends BaseViewModel {

  bool isActive = false;

  changeValue(bool value) {
    isActive = value;
    notifyListeners();
  }

}