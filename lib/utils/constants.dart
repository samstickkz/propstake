import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:propstake/data/services/local/social.service.dart';


import '../data/repository/repository.service.dart';
import '../data/services/local/locale.service.dart';
import '../data/services/local/navigation/navigation_service.dart';
import '../data/services/local/storage_service/auth_storage_service.dart';

import '../data/services/local/user.service.dart';
import '../data/services/remote/authentication.service.dart';
import '../data/services/remote/wallet_service.dart';
import '../locator.dart';


UserService userService = locator<UserService>();
LocaleService localeService = locator<LocaleService>();
AuthStorageService storageService = locator<AuthStorageService>();
AuthenticationService authenticationService = locator<AuthenticationService>();
NavigationService navigationService = locator<NavigationService>();
WalletService walletService = locator<WalletService>();
SocialService socialService = locator<SocialService>();
// DataStorageService dataStorage = locator<DataStorageService>();
Repository repository = locator<Repository>();

final GlobalKey<NavigatorState> navigatorKey1 = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> navigatorKey2 = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> navigatorKey3 = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> navigatorKey4 = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> navigatorKey5 = GlobalKey<NavigatorState>();

// CALLING THE DOT ENV FILE
String get baseUrl => dotenv.env['BASE_URL']!;
String get productionBaseUrl => dotenv.env['PRODUCTION_BASE_URL']!;
String get publicKey => dotenv.env['FLW_PUBLIC_KEY']!;
String get secretKey => dotenv.env['FLW_SECRET_KEY']!;