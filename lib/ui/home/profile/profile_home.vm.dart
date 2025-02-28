import 'package:propstake/utils/constants.dart';

import '../../base/base-vm.dart';
import 'settings/settings.ui.dart';

class ProfileHomeViewModel extends BaseViewModel {

  goToSettings(){
    navigationService.navigateToRoute(SettingsScreen());
  }

}