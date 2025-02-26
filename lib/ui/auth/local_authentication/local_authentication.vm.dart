import 'package:local_auth/local_auth.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/snack_message.dart';
import 'package:propstake/utils/string_extensions.dart';

import '../../../data/cache/database_keys.dart';
import '../../../utils/app_logger.dart';
import '../../../utils/constants.dart';
import '../../home/bottom_nav.ui.dart';

class LocalAuthViewModel extends BaseViewModel {
  LocalAuthentication localAuth = LocalAuthentication();

  bool isBiometricsAvailable = false;
  BiometricType? bioType;
  bool savedBio = false;

  init(){
    getBioData();
    checkBiometricType();
  }

  bool isIOS = false;
  bool isAndroid = false;
  bool supportState = false;

  Future getBioData() async {
    String? data = await storageService.readItem(key: StorageKey.bioDataInfo);
    AppLogger.debug("Saved BioMetric Data $data");
    if (data == null || data == "false") {
      savedBio = false;
      bioType = null;
    } else {
      List<String> type = data.split("/");
      savedBio = type[0] == "true" ? true : false;
      bioType = type[1] == "fingerPrint"
          ? BiometricType.fingerprint
          : BiometricType.face;
    }
    notifyListeners();
  }

  Future<bool> authenticateLocal()async{
    return await localAuth.authenticate(
      localizedReason: LocaleData.pleaseAutenticateToProceed.convertString(),
      options: const AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      ),
    );
  }

  checkBiometricType() async {
    final availB = await localAuth.getAvailableBiometrics();
    if (availB.contains(BiometricType.face)) {
      bioType = BiometricType.face;
    } else if (availB.contains(BiometricType.fingerprint)) {
      bioType = BiometricType.fingerprint;
    } else {
      notifyListeners();
    }
    notifyListeners();
  }

  checkAuthType() async {
    isBiometricsAvailable = await localAuth.isDeviceSupported();
    AppLogger.debug("IS BIO AVAILABLE::: $isBiometricsAvailable");
    if (isBiometricsAvailable) {
      await checkBiometricType();
    }
    notifyListeners();
  }

  saveBioType(bool? val)async{
    if(val==false){
      await storageService.storeItem(
          key: StorageKey.bioDataInfo,
          value: '${val??false}'
      );
      savedBio = val ?? false;
      notifyListeners();
    }else{
      bool isAuth = await authenticateLocal();
      if(isAuth){
        await storageService.storeItem(
            key: StorageKey.bioDataInfo,
            value: '${val??false}/${bioType == BiometricType.fingerprint? "fingerPrint":"faceID"}'
        );
        savedBio = val??false;
        notifyListeners();
        showCustomToast("${bioType == BiometricType.face? "face ID": "fingerPrint"} set successfully", success: true);
        goHome();
      }else{
        showCustomToast("${bioType == BiometricType.fingerprint? "face ID": "fingerPrint"} not valid");
      }
    }
  }

  goHome(){
    navigationService.navigateToAndRemoveUntilWidget(BottomNavigationScreen());
  }

}