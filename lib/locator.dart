import 'package:get_it/get_it.dart';

import 'data/repository/repository.service.dart';
import 'data/services/local/locale.service.dart';
import 'data/services/local/navigation/navigation_service.dart';
import 'data/services/local/storage_service/auth_storage_service.dart';
import 'data/services/local/storage_service/data_storage_service.dart';
import 'data/services/local/theme.service.dart';
import 'data/services/local/user.service.dart';
import 'data/services/remote/authentication.service.dart';
import 'ui/auth/auth.vm.dart';
import 'ui/auth/local_authentication/local_authentication.vm.dart';
import 'ui/auth/verify/verify.vm.dart';
import 'ui/base/base-vm.dart';
import 'ui/home/bottom_nav.vm.dart';
import 'ui/home/my_investment/my_investment.vm.dart';
import 'ui/home/profile/about_us/about_us.vm.dart';
import 'ui/home/profile/contact_us/contact_us.vm.dart';
import 'ui/home/profile/my_account/my_account.vm.dart';
import 'ui/home/profile/profile_home.vm.dart';
import 'ui/home/profile/security/security.vm.dart';
import 'ui/home/profile/settings/settings.vm.dart';
import 'ui/home/profile/terms_condition/terms_condition.vm.dart';
import 'ui/home/properties/properies.vm.dart';
import 'ui/onboarding/splash/splash.vm.dart';

GetIt locator = GetIt.I;

setupLocator() {
  registerViewModel();
  setUpServices();
}

setUpServices(){
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<AuthStorageService>(() => AuthStorageService());
  locator.registerLazySingleton<Repository>(() => Repository());
  locator.registerLazySingleton<LocaleService>(() => LocaleService());
  locator.registerLazySingleton<UserService>(() => UserService());
  locator.registerLazySingleton<ThemeModel>(() => ThemeModel());
  // locator.registerLazySingleton<DataStorageService>(() => DataStorageService());
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
}

registerViewModel(){
  /* TODO Setup viewModels*/
  locator.registerFactory<BaseViewModel>(() => BaseViewModel());
  locator.registerFactory<SplashScreenViewModel>(() => SplashScreenViewModel());
  locator.registerFactory<AuthViewModel>(() => AuthViewModel());
  locator.registerFactory<VerifyUserViewModel>(() => VerifyUserViewModel());
  locator.registerFactory<LocalAuthViewModel>(() => LocalAuthViewModel());
  locator.registerFactory<BottomNavigationViewModel>(() => BottomNavigationViewModel());
  locator.registerFactory<ProfileHomeViewModel>(() => ProfileHomeViewModel());
  locator.registerFactory<SettingsViewModel>(() => SettingsViewModel());
  locator.registerFactory<SecurityViewModel>(() => SecurityViewModel());
  locator.registerFactory<MyAccountViewModel>(() => MyAccountViewModel());
  locator.registerFactory<AboutUsViewModel>(() => AboutUsViewModel());
  locator.registerFactory<TermsAndConditionViewModel>(() => TermsAndConditionViewModel());
  locator.registerFactory<ContactUsViewModel>(() => ContactUsViewModel());
  locator.registerFactory<PropertiesViewModel>(() => PropertiesViewModel());
  locator.registerFactory<MyInvestHomeViewModel>(() => MyInvestHomeViewModel());
  // locator.registerFactory<PatientsAccountProfileViewModel>(() => PatientsAccountProfileViewModel());
  // locator.registerFactory<PatientsSecurityViewModel>(() => PatientsSecurityViewModel());
  // locator.registerFactory<PatientsEMRViewModel>(() => PatientsEMRViewModel());
  // locator.registerFactory<DoctorAppointmentHomeViewModel>(() => DoctorAppointmentHomeViewModel());
  // locator.registerFactory<PatientNotificationViewModel>(() => PatientNotificationViewModel());
  // locator.registerFactory<DoctorHomeViewModel>(() => DoctorHomeViewModel());
  // locator.registerFactory<DoctorAccountProfileViewModel>(() => DoctorAccountProfileViewModel());
  // locator.registerFactory<DoctorAccountSettingsHomeViewModel>(() => DoctorAccountSettingsHomeViewModel());
  // locator.registerFactory<DoctorPreferencesViewModel>(() => DoctorPreferencesViewModel());
  // locator.registerFactory<DoctorPaymentViewModel>(() => DoctorPaymentViewModel());
  // locator.registerFactory<DoctorSecurityViewModel>(() => DoctorSecurityViewModel());
  // locator.registerFactory<DoctorProfileViewModel>(() => DoctorProfileViewModel());
}