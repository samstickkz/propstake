import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:propstake/locator.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/auth_appbar.dart';
import 'package:propstake/widget/text_field.dart';
import 'package:provider/provider.dart';

import 'app_theme/app_theme.dart';
import 'data/cache/config.dart';
import 'data/services/local/navigation/navigation_service.dart';
import 'data/services/local/theme.service.dart';
import 'data/services/local/user.service.dart';
import 'ui/onboarding/splash/splash.ui.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await GetStorage.init();

  await setupLocator();

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
                        title: "ProStake",
                        theme: AppTheme.themeData(isDark: false),
                        darkTheme: AppTheme.themeData(isDark: true),
                        themeMode: themeProvider.themeMode,
                        home: const SplashScreen(),
                      );
                    },
                  ));
            }
        )
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AuthAppBar(),
      body: ListView(
        padding: 16.sp.padA,
        children: [
          AppText("Hello"),
          AppButton.fullWidth(
            isLoading: false,
            text: "Create Account",
            onTap: (){},
          ),
          10.sp.sbH,
          AppTextField(
            hintText: "Password",
          )
        ],
      ),
    );
  }
}

