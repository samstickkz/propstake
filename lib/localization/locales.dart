import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> locales =[
  MapLocale("en", LocaleData.EN),
];

mixin LocaleData {
  static const String emptyField = 'emptyField';
  static const String continues = 'continues';
  static const String emptyPhoneNumber = 'emptyPhoneNumber';
  static const String invalidPhoneNumber = 'invalidPhoneNumber';
  static const String password8 = 'password8';
  static const String passwordNumber = 'passwordNumber';
  static const String passwordCapital = 'passwordCapital';
  static const String passwordSmall = 'passwordSmall';
  static const String passwordSign = 'passwordSign';
  static const String enterPassword = 'enterPassword';
  static const String confirmPassword = 'confirmPassword';
  static const String confirmPasswordSamePassword = 'confirmPasswordSamePassword';
  static const String logOut = 'logOut';
  static const String confirmLogOut = 'confirmLogOut';
  static const String emailAddress = 'emailAddress';
  static const String loading = 'loading';
  static const String settings = 'settings';
  static const String setting = 'setting';
  static const String areYouSureYouWantTo = 'areYouSureYouWantTo';
  static const String inputYourPhoneNumber = 'inputYourPhoneNumber';
  static const String passwordShouldBeAtLeast8Characters = 'passwordShouldBeAtLeast8Characters';
  static const String passwordShouldContainSpecialCharacter = 'passwordShouldContainSpecialCharacter';
  static const String passwordShouldContainNumber = 'passwordShouldContainNumber';
  static const String passwordShouldContainCapitalLetter = 'passwordShouldContainCapitalLetter';
  static const String passwordShouldContainAlphabet = 'passwordShouldContainAlphabet';
  static const String cancel = 'cancel';


  static const Map<String, dynamic> EN = {
    settings: "Settings",
    setting: "Setting",
    emptyPhoneNumber: "Phone Number cannot be empty",
    loading: "Loading..",
    emailAddress: "Email Address",
    inputYourPhoneNumber: "Input Phone Number",
    logOut: "Log out",
    confirmLogOut: "Confirm Log out",
    password8: "Minimum of 8 characters.",
    enterPassword: "Enter Password",
    confirmPassword: "Confirm Password",
    passwordNumber: "A number",
    passwordCapital: "CAPITAL letter",
    passwordSmall: "small letter",
    confirmPasswordSamePassword: "The confirm password field must match the password.",
    passwordSign: "Password must include special characters such as &, @, #, or *.",
    invalidPhoneNumber: "Invalid Phone Number",
    emptyField: "Field cannot be empty",
    continues: 'Continue',
    cancel: 'Cancel',
    areYouSureYouWantTo: 'Are you sure you want to ',
    passwordShouldBeAtLeast8Characters: "Password Should be at least eight characters",
    passwordShouldContainSpecialCharacter: "Password Should contain special characters (\$-@!*)",
    passwordShouldContainNumber: "Password Should contain numbers (12345689)",
    passwordShouldContainCapitalLetter: "Password Should contain capital letters",
    passwordShouldContainAlphabet: "Password Should contain alphabets",

  };

}