import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> locales =[
  MapLocale("en", LocaleData.en)
];

String getLanguageFunction(int index){
  switch(index){
    case 0: return "English";
    default: return "Spanish";
  }
}


mixin LocaleData {

  static const String or = 'or';
  static const String cancel = 'cancel';
  static const String loginToYourAccount = 'loginToYourAccount';
  static const String welcomeBack = 'welcomeBack';
  static const String createAccount = 'createAccount';
  static const String phoneNumber = 'phoneNumber';
  static const String login = 'login';
  static const String createAnAccount = 'createAnAccount';
  static const String inputYourPhoneNumber = 'inputYourPhoneNumber';
  static const String password = 'password';
  static const String inputYourPassword = 'inputYourPassword';
  static const String proceed = 'proceed';
  static const String passwordShouldBeAtLeast8Characters = 'passwordShouldBeAtLeast8Characters';
  static const String passwordShouldContainSpecialCharacter = 'passwordShouldContainSpecialCharacter';
  static const String passwordShouldContainNumber = 'passwordShouldContainNumber';
  static const String passwordShouldContainCapitalLetter = 'passwordShouldContainCapitalLetter';
  static const String passwordShouldContainAlphabet = 'passwordShouldContainAlphabet';
  static const String firstName = 'firstName';
  static const String inputYourFirstName = 'inputYourFirstName';
  static const String lastName = 'lastName';
  static const String inputYourLatName = 'inputYourLatName';
  static const String continues = 'continues';
  static const String emptyField = 'emptyField';
  static const String invalidPhoneNumber = 'invalidPhoneNumber';
  static const String resend = 'resend';
  static const String forgotPassword = 'forgotPassword';
  static const String delete = 'delete';
  static const String hours = 'hours';
  static const String email = 'email';
  static const String emailAddress = 'emailAddress';
  static const String enterEmailAddress = 'enterEmailAddress';
  static const String confirmPassword = 'confirmPassword';
  static const String passwordShouldBeTheSame = 'passwordShouldBeTheSame';
  static const String completed = 'completed';
  static const String no = 'no';
  static const String skip = 'skip';
  static const String submit = 'submit';
  static const String changePassword = 'changePassword';
  static const String notification = 'notification';
  static const String setting = 'setting';
  static const String logout = 'logout';
  static const String closeAccount = 'closeAccount';
  static const String profileInformation = 'profileInformation';
  static const String updateProfile = 'updateProfile';
  static const String settings = 'settings';
  static const String language = 'language';
  static const String message = 'message';
  static const String typing = 'typing';
  static const String send = 'send';
  static const String confirmNewPassword = 'confirmNewPassword';
  static const String chooseNewPassword = 'chooseNewPassword';
  static const String newPassword = 'newPassword';
  static const String enterOldPassword = 'enterOldPassword';
  static const String oldPassword = 'oldPassword';
  static const String savePassword = 'savePassword';
  static const String forgetPassword = 'forgetPassword';

  static const Map<String, dynamic> en = {
    completed: "Completed",
    no: "No",
    forgetPassword: "Forgot Password",
    skip: "Skip",
    confirmNewPassword: "Confirm New Password",
    chooseNewPassword: "Choose New Password",
    newPassword: "New Password",
    enterOldPassword: "Enter Old Password",
    oldPassword: "Old Password",
    savePassword: "Save Password",
    submit: "Submit",
    email: "Email",
    emailAddress: "Email Address",
    enterEmailAddress: "Enter Email Address",
    confirmPassword: "Confirm Password",
    passwordShouldBeTheSame: "Confirm Password should be the same as password",
    hours: "Hours",
    delete: "Delete",
    or: "or",
    forgotPassword: "Forgot your Password?",
    proceed: "Proceed",
    resend: "Resend",
    invalidPhoneNumber: "Phone Number is invalid",
    emptyField: "Text Field cannot be empty",
    continues: "Continue",
    firstName: "First Name",
    inputYourFirstName: "Input your first name",
    lastName: "Last Name",
    inputYourLatName: "Input your Last name",
    inputYourPhoneNumber: "Input your phone number",
    password: "Password",
    inputYourPassword: "Input your password",
    passwordShouldBeAtLeast8Characters: "Password Should be at least eight characters",
    passwordShouldContainSpecialCharacter: "Password Should contain special characters (\$-@!*)",
    passwordShouldContainNumber: "Password Should contain numbers (12345689)",
    passwordShouldContainCapitalLetter: "Password Should contain capital letters",
    passwordShouldContainAlphabet: "Password Should contain alphabets",
    loginToYourAccount: "Login to your account",
    welcomeBack: "Welcome back",
    createAccount: "Create Account",
    phoneNumber: "Phone Number",
    login: "Login",
    createAnAccount: "Create An Account",
    cancel: "Cancel",
    changePassword: "Change Password",
    notification: "Notification",
    setting: "Setting",
    logout: "Logout",
    closeAccount: "Close Account",
    profileInformation: "Profile Information",
    updateProfile: "Update Profile",
    settings: "Settings",
    language: "Language",
    message: "Message",
    typing: "typing...",
    send: "Send",
  };

}

