import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:propstake/locator.dart';
import 'package:provider/provider.dart';

import 'app_theme/app_theme.dart';
import 'data/cache/config.dart';
import 'data/services/local/locale.service.dart';
import 'data/services/local/navigation/navigation_service.dart';
import 'data/services/local/notification.service.dart';
import 'data/services/local/theme.service.dart';
import 'data/services/local/user.service.dart';
import 'firebase_options.dart';
import 'ui/onboarding/splash/splash.ui.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: ".env");
  await GetStorage.init();

  await setupLocator();

  await locator<LocaleService>().init();
  // await NotificationService.initialize();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  //setup different deployment environment
  Config.appFlavor = Flavor.development;

  // Initialize and check login Status
  await locator<UserService>().initializer();


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  configureLocalization() async {
    final localeService = locator<LocaleService>();

    // Listen to language changes
    localeService.languageStream.listen((newLanguage) {
      _onLanguageChanged();
    });

    // Set initial locale
    await localeService.init();
  }

  Future<void> _onLanguageChanged() async {
    // Update UI when language changes
    setState(() {});
  }

  init()async{
    FocusManager.instance.primaryFocus?.unfocus();
    // Initialize and check login Status
    await configureLocalization();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    final localeService = LocaleService();
    localeService.dispose(); // Clean up when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? buildChangeNotifierProvider(): AnnotatedRegion(
      value: SystemUiOverlayStyle(
        // Customize system UI overlay
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white, // Match your nav bar color
        systemNavigationBarDividerColor: null,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        child: buildChangeNotifierProvider(),
      ),
    );
  }

  ChangeNotifierProvider<ThemeModel> buildChangeNotifierProvider() {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
          builder: (context, themeProvider, child) {
            return OKToast(
                child: ScreenUtilInit(
                  //setup to fit into bigger screens
                  designSize: const Size(428, 926),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (BuildContext context, Widget? child) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      navigatorKey: locator<NavigationService>().navigatorKey,
                      scaffoldMessengerKey: locator<NavigationService>().snackBarKey,
                      title: "PropStake",
                      theme: AppTheme.themeData(false),
                      darkTheme: AppTheme.themeData(true),
                      themeMode: themeProvider.themeMode,
                      home: const SplashScreen(),
                      supportedLocales: locator<LocaleService>().localization.supportedLocales,
                      localizationsDelegates: locator<LocaleService>().localization.localizationsDelegates,
                    );
                  },
                ));
          }
      )
  );
  }
}
