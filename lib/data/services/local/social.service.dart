import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:propstake/utils/app_logger.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../utils/snack_message.dart';

class SocialService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  User? user;



  Future<User?> signInWithApple() async {
    try {
      // Step 1: Perform Apple sign in request
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Step 2: Create an OAuthCredential from the Apple ID credential
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // Step 3: Sign in to Firebase using the credential
      UserCredential userCredential = await firebaseAuth.signInWithCredential(oauthCredential);

      user = userCredential.user;

      return user;

    } on SignInWithAppleAuthorizationException catch (e) {
      // Catch specific errors from Sign in with Apple
      switch (e.code) {
        case AuthorizationErrorCode.canceled:
          AppLogger.debug("User canceled the sign-in process.");
          break;
        case AuthorizationErrorCode.failed:
          AppLogger.debug("Sign-in with Apple failed.");
          break;
        case AuthorizationErrorCode.invalidResponse:
          AppLogger.debug("Invalid response received from Apple.");
          break;
        case AuthorizationErrorCode.notHandled:
          AppLogger.debug("Sign-in request was not handled.");
          break;
        case AuthorizationErrorCode.unknown:
          AppLogger.debug("An unknown error occurred during Apple sign-in.");
          break;
        case AuthorizationErrorCode.notInteractive:
        // TODO: Handle this case.
          break;
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase sign-in errors
      if (e.code == 'invalid-credential') {
        AppLogger.debug("The provided credential is invalid.");
      } else if (e.code == 'account-exists-with-different-credential') {
        AppLogger.debug("Account exists with different credentials.");
      } else if (e.code == 'user-disabled') {
        AppLogger.debug("This user has been disabled.");
      } else if (e.code == 'operation-not-allowed') {
        AppLogger.debug("This operation is not allowed.");
      } else if (e.code == 'invalid-verification-code') {
        AppLogger.debug("Invalid verification code.");
      } else {
        AppLogger.debug("Firebase Auth error: ${e.message}");
      }
    } on PlatformException catch (e) {
      // Handle platform-specific issues (iOS, Android)
      AppLogger.debug("Platform exception: ${e.message}");
    } catch (e) {
      // Handle any other errors (general)
      AppLogger.debug("An error occurred: $e");
    }

    return null; // Return null if the sign-in fails
  }


  Future<String?> signInWithGoogle() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
      hostedDomain: '',
    );
    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      AppLogger.debug('Google User is: $googleUser');
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      AppLogger.debug('Google Token: ${googleAuth.accessToken}');
      AppLogger.debug('Google idToken: ${googleAuth.idToken}');



      // try {
      //   final AuthCredential credential = GoogleAuthProvider.credential(
      //     accessToken: googleAuth.accessToken,
      //     idToken: googleAuth.idToken,
      //   );
      //
      //   print("done::: ${credential.toString()}");
      //
      //   try{
      //     final UserCredential authResult = await firebaseAuth.signInWithCredential(credential);
      //
      //     print("AUTH RESULT $authResult");
      //     print("AUTH RESULT ${authResult.user}");
      //
      //     if (authResult.user != null) {
      //       user = authResult.user;
      //     }
      //   }catch(err){
      //     log("USER DATA FROM FIREBASE:::: ${err.toString()}");
      //     print("USER DATA FROM FIREBASE:::: ${err.toString()}");
      //   }
      // } catch (err) {
      //   log("ERROR ON credential ${err.toString()}");
      // }
      return googleAuth.accessToken;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        showCustomToast("The account already exists with a different credential");
      } else if (e.code == 'invalid-credential') {
        showCustomToast("Error occurred while accessing credentials. Try again");
      }
    } catch (e) {
      AppLogger.debug(e.toString());
      AppLogger.debug("Google Sign-In Failed: ($e). Try again");
      return null;
    }
    return null;
  }

}