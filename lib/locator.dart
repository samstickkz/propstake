import 'package:get_it/get_it.dart';

import 'data/repository/repository.service.dart';
import 'data/services/local/navigation/navigation_service.dart';
import 'data/services/local/storage_service/auth_storage_service.dart';
import 'data/services/local/storage_service/data_storage_service.dart';
import 'data/services/local/theme.service.dart';
import 'data/services/local/user.service.dart';
import 'data/services/remote/authentication.service.dart';
import 'ui/auth/auth.vm.dart';
import 'ui/auth/verify/verify.vm.dart';
import 'ui/base/base-vm.dart';
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
  // locator.registerLazySingleton<AppCache>(() => AppCache());
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
  // locator.registerFactory<VerifyEmailViewModel>(() => VerifyEmailViewModel());
  // locator.registerFactory<PatientHomeViewModel>(() => PatientHomeViewModel());
  // locator.registerFactory<PatientSpecialistListViewModel>(() => PatientSpecialistListViewModel());
  // locator.registerFactory<PatientDashBoardViewModel>(() => PatientDashBoardViewModel());
  // locator.registerFactory<ProfileSpecialistProfileViewModel>(() => ProfileSpecialistProfileViewModel());
  // locator.registerFactory<BookSessionViewModel>(() => BookSessionViewModel());
  // locator.registerFactory<PatientWalletViewModel>(() => PatientWalletViewModel());
  // locator.registerFactory<PatientAppointmentHomeViewModel>(() => PatientAppointmentHomeViewModel());
  // locator.registerFactory<AccountSettingsHomeViewModel>(() => AccountSettingsHomeViewModel());
  // locator.registerFactory<PatientsPreferencesViewModel>(() => PatientsPreferencesViewModel());
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