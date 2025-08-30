import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:native_image_cropper/native_image_cropper.dart';
import 'package:propstake/utils/dartz.x.dart';

import '../../data/cache/view_state.dart';
import '../../utils/app_logger.dart';
import '../../utils/constants.dart';
import '../../utils/widget_extensions.dart';
import '../../widget/action_widget.dart';
import '../../widget/cropper_for_immage.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.loading;

  ViewState get viewState => _viewState;

  final formKey = GlobalKey<FormState>();
  final GlobalKey repaintKey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  // Future<bool> isConnectedToNetwork() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   return connectivityResult != ConnectivityResult.none;
  // }

  String convertPhoneNumber(String number) {
    String replacement = "0";
    if (number.length < 3) {
      // If the input string is less than 3 characters, replace the entire string
      return replacement + number.substring(replacement.length);
    } else {
      // Replace the first 3 characters and concatenate the rest of the string
      return replacement + number.substring(3);
    }
  }

  goToProfile()async {
    // navigationService.navigateToRoute(const ProfileHomeScreen());
  }

  Future<Uint8List> convertFileToBytes(File file) async {
    try {
      Uint8List bytes = await file.readAsBytes();
      return bytes;
    } catch (e) {
      AppLogger.debug("Error reading file: $e");
      return Uint8List(0);
    }
  }

  Future<String?> pickCroppedImage(File imageFile, {double aspectRatio = 1/1, CropMode mode = CropMode.oval}) async {
    try {
      return await navigationService.navigateToRoute(DefaultPage(bytes: await convertFileToBytes(imageFile), aspectRatio: aspectRatio, mode: mode));
    } catch (e) {
      AppLogger.debug("Error cropping image: $e");
      return null;
    }
  }

  showLogout()async{
    popDialog(
      onTap: userService.logout,
      title: "Are you sure?",
      subTitle: "This will require you to sign in again with your login details when you return ",
      doItButtonText: "LOG OUT",
      cancelButtonText: "CANCEL"
    );
  }

  getUser() async {
    startLoader();
    try{
      var res = await authenticationService.getUser();
    }catch(err){
      AppLogger.debug(err.toString());
    }
    stopLoader();
    notifyListeners();
  }

  Future<num?> getWallet() async {
    try{
      var res = await walletService.getWallet();
      if(res.isRight()){
        notifyListeners();

        return res.asRight().data ?? 0;
      } else{
        notifyListeners();
        return null;
      }
    }catch(err){
      AppLogger.debug(err.toString());
      notifyListeners();
      return null;
    }
  }

  set viewState(ViewState newState) {
    _viewState = newState;
    _viewState == ViewState.loading ? isLoading = true : isLoading = false;
    notifyListeners();
  }

  popLogout() {
    popDialog(
      onTap: userService.logout,
      title: "Log out",
      width: width(navigationService.context) - 80,
      barrierDismissible: true
    );
  }

  goToNotification() {
    // navigationService.navigateToWidget(const NotificationScreen());
  }

  bool isLoading = false;

  void startLoader() {
    if (!isLoading) {
      isLoading = true;
      viewState = ViewState.loading;
      notifyListeners();
    }
  }



  String getFileTypeFromUrl(String url) {
    List<String> parts = url.split('/');
    String fileName = parts.last;
    List<String> fileNameParts = fileName.split('.');

    if (fileNameParts.length > 1) {
      String extension = fileNameParts.last;
      switch (extension.toLowerCase()) {
        case 'jpg':
        case 'jpeg':
        case 'png':
        case 'svg':
        case 'heic':
        case 'webp':
          return 'image.${extension.toLowerCase()}';
        case 'mp4':
        case 'avi':
        case 'mov':
          return 'video.${extension.toLowerCase()}';
        case 'pdf':
          return 'PDF.${extension.toLowerCase()}';
        case 'docx':
        case 'doc':
          return 'Document.${extension.toLowerCase()}';
        default:
          return 'Unknown';
      }
    } else {
      return 'Unknown';
    }
  }

  Future popDialog({
    VoidCallback? onTap,
    VoidCallback? otherOnTap,
    String? title,
    String? subTitle,
    bool oneButton = false,
    double? width,
    String? cancelButtonText,
    String? doItButtonText,
    Widget? prefixIcon1,
    bool barrierDismissible = false,
    Widget? body,
    VoidCallback? cancelTap,
    Widget? child,
    Widget? prefixIcon2,
  }) async {
    return await showCupertinoModalSheet(
      barrierDismissible: barrierDismissible,
      context: navigationService.context,
      builder: (BuildContext context) => ActionBottomSheet(
        onTap: onTap,
        title: title,
        width: width,
        oneButton: oneButton,
        subTitle: subTitle,
        body: body,
        cancelButtonText: cancelButtonText,
        doItButtonText: doItButtonText,
        prefixIcon1: prefixIcon1,
        prefixIcon2: prefixIcon2,
        otherOnTap: otherOnTap,
        cancelTap: cancelTap,
        child: child,
      )
    );
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      viewState = ViewState.idle;
      notifyListeners();
    }
  }

  goToTeacherAnnouncement(){
    // navigationService.navigateToWidget(const TeacherAnnouncementHomeScreen());
  }


  List<Color> getRandomColors(int count){
    final Random _random = Random();

    Color generateRandomColor() {
      return Color.fromARGB(
        255, // Alpha channel (fully opaque)
        _random.nextInt(250), // Red channel
        _random.nextInt(250), // Green channel
        _random.nextInt(256), // Blue channel
      );
    }
    return List.generate(count, (_) => generateRandomColor());
  }

  String formatDateSlash(DateTime dateTime) {
    return DateFormat('dd/MM/yy').format(dateTime);
  }

}