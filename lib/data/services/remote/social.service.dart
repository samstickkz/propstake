import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../locator.dart';
import '../../../utils/app_logger.dart';
import '../../../utils/constants.dart';
import '../../../utils/snack_message.dart';
import '../../repository/repository.service.dart';

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
      String error = "";
      switch (e.code) {
        case AuthorizationErrorCode.canceled:
          error = "User canceled the sign-in process.";
          break;
        case AuthorizationErrorCode.failed:
          error = "Sign-in with Apple failed.";
          break;
        case AuthorizationErrorCode.invalidResponse:
          error = "Invalid response received from Apple.";
          break;
        case AuthorizationErrorCode.notHandled:
          error = "Sign-in request was not handled.";
          break;
        case AuthorizationErrorCode.unknown:
          error = "An unknown error occurred during Apple sign-in.";
          break;
        case AuthorizationErrorCode.notInteractive:
          error = "Firebase Auth error: ${e.message}";
          break;
        }
      toast(error);
    } on FirebaseAuthException catch (e) {
      String error = "";
      if (e.code == 'invalid-credential') {
        error = "The provided credential is invalid.";
      } else if (e.code == 'account-exists-with-different-credential') {
        error = "Account exists with different credentials.";
      } else if (e.code == 'user-disabled') {
        error = "This user has been disabled.";
      } else if (e.code == 'operation-not-allowed') {
        error = "This operation is not allowed.";
      } else if (e.code == 'invalid-verification-code') {
        error = "Invalid verification code.";
      } else {
        error = "Apple Auth error: ${e.message}";
      }
      showCustomToast(error, title: "Firebase Error");
    } on PlatformException catch (e) {
      // Handle platform-specific issues (iOS, Android)
      showCustomToast("Platform exception: ${e.message}", title: "Platform Error");
    } catch (e) {
      // Handle any other errors (general)
      showCustomToast("An error occurred: $e", title: "Catch Apple Error");
    }

    return null; // Return null if the sign-in fails
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      final UserCredential authResult = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      AppLogger.debug("SignUP email ${authResult.user?.uid.toString()}");
      if (authResult.user?.uid != null) {
        user = authResult.user;
      }  else {
        AppLogger.debug('AUTHFLOW - Email Token is null.');
        return null;
      }
      return user;
    } on FirebaseAuthException catch (e) {
      AppLogger.debug("Error code:::: ${e.code}");
       if (e.code == 'email-already-in-use') {
        toast("Email already in use by another provider");
        return user;
      } else if (e.code == 'invalid-credential') {
        toast("Error occurred while accessing credentials. Try again");
      }
      return null;
    } catch (e) {
      AppLogger.debug(e.toString());
      toast("Email sign up Failed: ($e). Try again");
      return null;
    }
    return user;
  }
  
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final UserCredential authResult = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      AppLogger.debug("AUTH RESULT EMAIL +++ ${authResult}");
      if (authResult.user != null) {
        user = authResult.user;
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        navigationService.goBack();
        showCustomToast("The account already exists with a different credential", title: "Firebase Error");
      } else if (e.code == 'invalid-credential') {
        showCustomToast("Error occurred while accessing credentials. Try again", title: "Firebase Error");
      } else{
        showCustomToast("Error occurred while accessing credentials. Try again", title: "Firebase Error");
      }
    } catch (e) {
      AppLogger.debug(e.toString());
      showCustomToast("Google Sign-In Failed: ($e). Try again", title: "Login Error");
      return null;
    }
    return user;
  }


  Future<User?> signInWithGoogle() async {
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

      try {
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        AppLogger.debug("done::: ${credential.toString()}");

        try{
          final UserCredential authResult = await firebaseAuth.signInWithCredential(credential);

          AppLogger.debug("AUTH RESULT $authResult");
          AppLogger.debug("AUTH RESULT ${authResult.user}");

          if (authResult.user != null) {
            user = authResult.user;
          }
        }catch(err){
          AppLogger.debug("USER DATA FROM FIREBASE:::: ${err.toString()}");
          AppLogger.debug("USER DATA FROM FIREBASE:::: ${err.toString()}");
        }
      } catch (err) {
        AppLogger.debug("ERROR ON credential ${err.toString()}");
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        navigationService.goBack();
        showCustomToast("The account already exists with a different credential", title: "Firebase Error");
      } else if (e.code == 'invalid-credential') {
        showCustomToast("Error occurred while accessing credentials. Try again", title: "Firebase Error");
      }
    } catch (e) {
      AppLogger.debug(e.toString());
      showCustomToast("Google Sign-In Failed: ($e). Try again", title: "Login Error");
      return null;
    }
    return user;
  }


}

final socialBloc = locator<SocialService>();