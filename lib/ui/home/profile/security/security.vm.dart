import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/constants.dart';

import 'social_login/social_login.ui.dart';

class SecurityViewModel extends BaseViewModel {

  bool isActive = false;

  changeValue(bool value) {
    isActive = value;
    notifyListeners();
  }

  goToSocial(){
    navigationService.navigateToRoute(SocialLoginScreen());
  }

}