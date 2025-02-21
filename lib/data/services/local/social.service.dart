// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'dart:math' as math;
//
// import 'package:crypto/crypto.dart';
// import 'package:driptok_mobile_app/src/data/cache/constants.dart';
// import 'package:driptok_mobile_app/src/data/repository/repository.service.dart';
// import 'package:driptok_mobile_app/src/locator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:twitter_login/twitter_login.dart';
//
// import '../../../utils/app_strings.dart';
// import '../../../utils/snack_message.dart';
// import '../../model/user_object.dart';
//
// class SocialService {
//   Repository _repository = locator<Repository>();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   User? user;
//
//   final TwitterLogin twitterLogin = TwitterLogin(
//     apiKey: 'WDHdiY0fTWfPHSUT7UEEYw3sb',
//     apiSecretKey: 'tbF0wH5N54l5E7F2NbJybHDWX52JFUKjVid1CTklgoCHmsZXme',
//     redirectURI: 'https://driptok.firebaseapp.com/__/auth/handler',
//   );
//   final FacebookAuth facebookAuth = FacebookAuth.instance;
//
//
//   Future<User?> signInWithApple() async {
//     try {
//       // Step 1: Perform Apple sign in request
//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//       );
//
//       // Step 2: Create an OAuthCredential from the Apple ID credential
//       final oauthCredential = OAuthProvider("apple.com").credential(
//         idToken: appleCredential.identityToken,
//         accessToken: appleCredential.authorizationCode,
//       );
//
//       // Step 3: Sign in to Firebase using the credential
//       UserCredential userCredential = await firebaseAuth.signInWithCredential(oauthCredential);
//
//       user = userCredential.user;
//
//       return user;
//
//     } on SignInWithAppleAuthorizationException catch (e) {
//       // Catch specific errors from Sign in with Apple
//       switch (e.code) {
//         case AuthorizationErrorCode.canceled:
//           print("User canceled the sign-in process.");
//           break;
//         case AuthorizationErrorCode.failed:
//           print("Sign-in with Apple failed.");
//           break;
//         case AuthorizationErrorCode.invalidResponse:
//           print("Invalid response received from Apple.");
//           break;
//         case AuthorizationErrorCode.notHandled:
//           print("Sign-in request was not handled.");
//           break;
//         case AuthorizationErrorCode.unknown:
//           print("An unknown error occurred during Apple sign-in.");
//           break;
//         case AuthorizationErrorCode.notInteractive:
//         // TODO: Handle this case.
//           break;
//       }
//     } on FirebaseAuthException catch (e) {
//       // Handle Firebase sign-in errors
//       if (e.code == 'invalid-credential') {
//         print("The provided credential is invalid.");
//       } else if (e.code == 'account-exists-with-different-credential') {
//         print("Account exists with different credentials.");
//       } else if (e.code == 'user-disabled') {
//         print("This user has been disabled.");
//       } else if (e.code == 'operation-not-allowed') {
//         print("This operation is not allowed.");
//       } else if (e.code == 'invalid-verification-code') {
//         print("Invalid verification code.");
//       } else {
//         print("Firebase Auth error: ${e.message}");
//       }
//     } on PlatformException catch (e) {
//       // Handle platform-specific issues (iOS, Android)
//       print("Platform exception: ${e.message}");
//     } catch (e) {
//       // Handle any other errors (general)
//       print("An error occurred: $e");
//     }
//
//     return null; // Return null if the sign-in fails
//   }
//
//
//
//   Future<User?> signUpWithEmail(String email, String password) async {
//     try {
//       final UserCredential authResult = await firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//
//       log("SignUP email ${authResult.user?.uid.toString()}");
//       if (authResult.user?.uid != null) {
//         user = authResult.user;
//       }  else {
//         AppLogger.debug('AUTHFLOW - Email Token is null.');
//         return null;
//       }
//       return user;
//     } on FirebaseAuthException catch (e) {
//       print("Error code:::: ${e.code}");
//       log(e.code.toString());
//       if (e.code == 'account-exists-with-different-credential') {
//         var resData = await checkSignInMethods(email);
//         user = resData;
//         return user;
//       } else if (e.code == 'email-already-in-use') {
//         toastBar("Email already in use by another provider", AppStrings.error);
//         return user;
//       } else if (e.code == 'invalid-credential') {
//         toastBar("Error occurred while accessing credentials. Try again", AppStrings.error);
//       }
//       return null;
//     } catch (e) {
//       AppLogger.debug(e.toString());
//       toastBar("Email sign up Failed: ($e). Try again", AppStrings.error);
//       return null;
//     }
//     return user;
//   }
//
//   Future<User?> checkSignInMethods(String email) async {
//     print("Checking sign in method of email");
//     try {
//       // Fetch the sign-in methods for the provided email
//       List<String> signInMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);
//
//       if (signInMethods.isEmpty) {
//         print("No sign-in methods found for this email.");
//       } else {
//         print("Sign-in methods for $email:");
//         for (var method in signInMethods) {
//           print("Method: $method");
//           var response = await _handleProviderLinking(method, email);
//           return user;
//         }
//       }
//       return null;
//     } catch (e) {
//       print('Error fetching sign-in methods: $e');
//       return null;
//     }
//   }
//
//
//   Future<User?> _handleProviderLinking(String provider, String email) async {
//     switch (provider) {
//       case 'google.com':
//         toastBar('You signed in with Google', AppStrings.error);
//         return null;
//         // return await signInWithGoogle();
//       case 'facebook.com':
//         toastBar('You signed in with Facebook', AppStrings.error);
//         return null;
//         return await signInWithFacebook();
//       case 'twitter.com':
//         toastBar('User signed in with Twitter', AppStrings.error);
//         return null;
//         return await signInWithTwitter2();
//       case 'apple.com':
//         toastBar('User signed in with Apple', AppStrings.error);
//         return null;
//         return Platform.isIOS? await signInWithApple() : null;
//       default:
//         return null;
//     }
//   }
//
//
//   Future<User?> signInWithEmailCredentials(String email, String password) async {
//     try {
//       AuthCredential emailCredential = EmailAuthProvider.credential(email: email, password: password);
//
//       UserCredential userCredential = await firebaseAuth.signInWithCredential(emailCredential);
//
//       user = userCredential.user;
//
//       return user;
//     } on FirebaseAuthException catch (e) {
//       print("Error code:::: ${e.code}");
//       log("FIREBASE ERROR CODE ON CREDENTIAL LOGIN ${e.code}");
//       log("FIREBASE MESSAGE CODE ON CREDENTIAL LOGIN ${e.message}");
//
//       toastBar(e.message??"", AppStrings.error);
//       // if (e.code == 'account-exists-with-different-credential') {
//       //
//       // } else if (e.code == 'email-already-in-use') {
//       //   try{
//       //     await signInWithEmail(email, password);
//       //   }catch(err){
//       //     toastBar("The account already exists and doesn't need to be recreated try Login", AppStrings.error);
//       //     return null;
//       //   }
//       //   return null;
//       // } else if (e.code == 'invalid-credential') {
//       //   toastBar("Error occurred while accessing credentials. Try again", AppStrings.error);
//       // }
//       return null;
//     } catch (e) {
//       AppLogger.debug(e.toString());
//       toastBar("Email sign up Failed: ($e). Try again", AppStrings.error);
//       return null;
//     }
//     return user;
//   }
//
//   Future<User?> signInWithEmail(String email, String password) async {
//     try {
//       final UserCredential authResult = await firebaseAuth
//           .signInWithEmailAndPassword(email: email, password: password);
//
//       print("AUTH RESULT EMAIL +++ ${authResult}");
//       if (authResult.user != null) {
//         user = authResult.user;
//       }
//
//       return user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'account-exists-with-different-credential') {
//         navigationService.goBack();
//         toastBar("The account already exists with a different credential", AppStrings.error);
//       } else if (e.code == 'invalid-credential') {
//         toastBar("Error occurred while accessing credentials. Try again", AppStrings.error);
//       }
//     } catch (e) {
//       AppLogger.debug(e.toString());
//       toastBar("Google Sign-In Failed: ($e). Try again", AppStrings.error);
//       return null;
//     }
//     return user;
//   }
//
//   Future<User?> signInWithFacebook() async {
//     try {
//       final LoginResult result = await facebookAuth.login();
//
//       // Check if login was successful and accessToken is not null
//       if (result.status != LoginStatus.success || result.accessToken == null) {
//         navigationService.goBack();
//         toastBar("you don\'t have an account with driptok, please sign up!", AppStrings.error);
//         return null;
//       }
//
//       final AuthCredential credential =
//       FacebookAuthProvider.credential(result.accessToken!.tokenString);
//
//       final UserCredential authResult =
//       await firebaseAuth.signInWithCredential(credential);
//
//       log("USERS DATA:::: ${authResult.credential}");
//       // final User? user = authResult.user;
//
//       if (user != null) {
//         // Check if the user is a new user
//         // if (authResult.additionalUserInfo != null &&
//         //     authResult.additionalUserInfo!.isNewUser) {
//         String handle = '@${user?.displayName ?? "User"}';
//
//         Map<String, dynamic> userDetails = {
//           'user_email': user?.email,
//           'user_handle': handle,
//           'user_name': user?.displayName,
//           'user_profile_image_url': user?.photoURL,
//           'user_type': 'Person',
//         };
//
//         UserObject? userObject = userService.user;
//
//         // Update the existing UserObject using copyWith
//         userObject = userObject.copyWith(
//           userEmail: userDetails['user_email'],
//           userHandle: userDetails['user_handle'],
//           userName: userDetails['user_name'],
//           userProfileImageUrl: userDetails['user_profile_image_url'],
//           userType: userDetails['user_type'],
//         );
//
//
//         await userService.storeAuthUser(response: UserObject.fromJson(userDetails));
//
//         await _repository.saveUserDetailsFromAuth(user?.displayName ?? "",
//             user?.email ?? "", user?.photoURL ?? "", handle, user?.uid??"");
//
//
//         AppLogger.debug('Facebook Sign-In: completed');
//
//
//         return user;
//       } else {
//         // User is null
//         AppLogger.debug('Facebook Sign-In Failed: User is null');
//         return null;
//       }
//     } catch (e) {
//       AppLogger.debug('Facebook Sign-In Failed: $e');
//       return null;
//     }
//   }
//
//   Future<User?> signInWithGoogle() async {
//     await FirebaseAuth.instance.signOut();
//     GoogleSignIn googleSignIn = GoogleSignIn(
//       scopes: [
//         'email',
//       ],
//       hostedDomain: '',
//     );
//     try {
//       GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       AppLogger.debug('Google User is: $googleUser');
//       if (googleUser == null) {
//         return null;
//       }
//
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//
//       try {
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//
//         print("done::: ${credential.toString()}");
//
//         try{
//           final UserCredential authResult = await firebaseAuth.signInWithCredential(credential);
//
//           print("AUTH RESULT $authResult");
//           print("AUTH RESULT ${authResult.user}");
//
//           if (authResult.user != null) {
//             user = authResult.user;
//           }
//         }catch(err){
//           log("USER DATA FROM FIREBASE:::: ${err.toString()}");
//           print("USER DATA FROM FIREBASE:::: ${err.toString()}");
//         }
//       } catch (err) {
//         log("ERROR ON credential ${err.toString()}");
//       }
//       return user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'account-exists-with-different-credential') {
//         navigationService.goBack();
//         toastBar("The account already exists with a different credential", AppStrings.error);
//       } else if (e.code == 'invalid-credential') {
//         toastBar("Error occurred while accessing credentials. Try again", AppStrings.error);
//       }
//     } catch (e) {
//       AppLogger.debug(e.toString());
//       toastBar("Google Sign-In Failed: ($e). Try again", AppStrings.error);
//       return null;
//     }
//     return user;
//   }
//
//   Future<User?> signInWithTwitter() async {
//     try {
//       final twitterLoginResult = await twitterLogin.login();
//
//       final AuthCredential credential = TwitterAuthProvider.credential(
//         accessToken: twitterLoginResult.authToken!,
//         secret: twitterLoginResult.authTokenSecret!,
//       );
//
//       final UserCredential authResult =
//       await firebaseAuth.signInWithCredential(credential);
//       final User? user = authResult.user;
//       toastBar("Authentication successful", AppStrings.success);
//
//       return user;
//     } catch (e) {
//       // print('Twitter Sign-In Failed: $e');
//       return null;
//     }
//   }
//
//   Future<User?> signInWithTwitter2() async {
//     TwitterAuthProvider twitterProvider = TwitterAuthProvider();
//     try {
//       UserCredential? userCredential; // Declare userCredential as nullable
//
//       // Perform sign-in based on platform
//       if (kIsWeb) {
//         userCredential =
//         await FirebaseAuth.instance.signInWithPopup(twitterProvider);
//       } else {
//         userCredential =
//         await FirebaseAuth.instance.signInWithProvider(twitterProvider);
//       }
//
//       if(userCredential.user != null){
//
//         user = userCredential.user;
//         print("Twitter user is ::: ${userCredential.user}");
//         Map<String, dynamic> userDetails = {
//           'user_email': userCredential.user!.email,
//           'user_handle': userCredential.additionalUserInfo?.username,
//           'user_name': userCredential.user!.displayName,
//           'user_profile_image_url': userCredential.user!.photoURL,
//           'user_type': 'Person',
//         };
//
//         UserObject? userObject = userService.user;
//
//         // Update the existing UserObject using copyWith
//         userObject = userObject.copyWith(
//             userEmail: userDetails['user_email'],
//             userHandle: userDetails['user_handle'],
//             userName: userDetails['user_name'],
//             userProfileImageUrl: userDetails['user_profile_image_url'],
//             userType: userDetails['user_type'],
//             firebaseAuthenticationToken:
//             userDetails['firebase_authentication_token']
//         );
//
//         await userService.storeAuthUser(response: UserObject.fromJson(userDetails));
//
//         //TODO: remove this function below later
//         await _repository.saveUserDetailsFromAuth(
//             userCredential.user!.displayName ?? "",
//             userCredential.user!.email ?? "",
//             userCredential.user!.photoURL ?? "",
//             userCredential.additionalUserInfo?.username ?? "",
//             userCredential.user!.uid);
//
//         // Show sign-up toast if the user is new
//         if (userCredential.additionalUserInfo?.isNewUser ?? false) {
//           // _showSignUpToast(context);
//         }
//       }
//
//
//       return user; // Return userCredential
//     } catch (e) {
//       print('Twitter Sign-In Failed: $e');
//       return null; // Return null in case of error
//     }
//   }
//
// }
//
// final socialBloc = locator<SocialService>();