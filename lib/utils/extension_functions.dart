import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_logger.dart';

extension BuildContextWrapper on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }

  double get width {
    return MediaQuery.of(this).size.width;
  }

  bool get isTablet {
    return MediaQuery.of(this).size.width > 600;
  }

  bool get isMinimumScreenHeight {
    final iosMinHeight = MediaQuery.of(this).size.height < 845;
    final androidMinHeight = MediaQuery.of(this).size.height < 685;
    return Platform.isIOS ? iosMinHeight : androidMinHeight;
  }

  void screenHeightAndWidth() {
    final screenWidth = MediaQuery.of(this).size.width;
    final screenHeight = MediaQuery.of(this).size.height;
    AppLogger.debug('||Screen Width: $screenWidth || \n|| Screen Height: $screenHeight ||');
  }

  crashReport() {
    final screenHeight = height;
    final screenWidth = width;
    Future.delayed(const Duration(seconds: 2), () {
      throw StateError("Crash to get iPhone screen dimensions:: screenHeight: $screenHeight, screenWidth: $screenWidth");
    });
  }

  TextTheme get textTheme => Theme.of(this).textTheme;

  ButtonThemeData get buttonTheme => Theme.of(this).buttonTheme;

  void pop([dynamic result]) {
    Navigator.of(this).pop(result);
  }

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Future<dynamic> push(Widget destination) {
    return Navigator.push(this, MaterialPageRoute(builder: (_) => destination));
  }

  Future<dynamic> pushReplacement(Widget destination) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {dynamic argument}) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      routeName, // Replace with your route name
      // ModalRoute.withName(AppRoutes.loginScreen), // Keeps the login screen in the stack
      (Route<dynamic> route) => false, // This removes all the previous routes
      arguments: argument, // Pass your arguments here
    );
  }

  Future<void> launchAppUrl(String reportUrl) async {
    final Uri url = Uri.parse(reportUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not find url');
    }
  }

  void showSnackBar({String? message, Widget? content}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        elevation: 1.0,
        content: content ??
            SizedBox(
              width: width,
              height: 30,
              child: Center(
                child: Text(
                  message ?? "",
                  maxLines: 2,
                ),
              ),
            ),
      ),
    );
  }
}

extension Greeting on DateTime {
  String get greeting {
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}

extension CopyWithExtension on SvgPicture {
  SvgPicture copyWith({Color? color}) {
    return SvgPicture.asset('', color: color);
  }
}

extension StringExtension on String {
  String get capitalizeFirstLetter {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}

extension IsNullOrEmpty on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}

extension TakeWhile<T> on List<T> {
  List<T> takeWhileOnLength(int count) {
    if (length < count) {
      return this;
    }
    return take(count).toList();
  }
}

LinearGradient get gradient => const LinearGradient(
      begin: Alignment(0.72, 0.69),
      end: Alignment(-0.72, -0.69),
      colors: [
        Color(0xFF042372),
        Color(0xFF0538BB),
      ],
    );

String? getFileName(String? path) {
  if (path == null) return null;
  return path.split('/').last;
}

String? getFileType(String? path) {
  if (path == null) return null;
  return path.split('.').last.toUpperCase();
}

String formatBalance(String balance) {
  final double parsedBalance = double.parse(balance);
  return parsedBalance.toStringAsFixed(2);
}

String targetPercentage(String totalAmount, String targetAmount) {
  double total = double.parse(totalAmount);
  double target = double.parse(targetAmount);

  double percentage = (total / target) * 100;

  return percentage.toStringAsFixed(2);
}

String dateYMDFormat(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

String dateFormatted(DateTime date) {
  return DateFormat('dd MMMM, yyyy').format(date);
}