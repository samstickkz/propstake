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
  static const String exploreProperties = 'exploreProperties';
  static const String smartRealEstateInvesting = 'smartRealEstateInvesting';
  static const String ownAPieceOfRealEstate = 'ownAPieceOfRealEstate';
  static const String passiveIncomeMadeSimple = 'passiveIncomeMadeSimple';
  static const String earnConsistentReturns = 'earnConsistentReturns';
  static const String startWithJust100 = 'startWithJust100';
  static const String noLargeDownPayments = 'noLargeDownPayments';
  static const String join = 'join';
  static const String propertyStake = 'PropertyStake';
  static const String enterPassword = 'enterPassword';
  static const String termsOfService = 'termsOfService';
  static const String privacyPolicy = 'privacyPolicy';
  static const String verifyCode = 'verifyCode';
  static const String enterVerificationCode = 'enterVerificationCode';
  static const String verificationCode = 'verificationCode';
  static const String confirm = 'confirm';
  static const String didntReceiveCode = 'didntReceiveCode';
  static const String biometricVerificationSetup = 'biometricVerificationSetup';
  static const String enableBiometricVerification = 'enableBiometricVerification';
  static const String fingerprintSetup = 'fingerprintSetup';
  static const String placeFingerOnSensor = 'placeFingerOnSensor';
  static const String hurray = 'hurray';
  static const String accountCreatedSuccessfully = 'accountCreatedSuccessfully';
  static const String accessMyAccount = 'accessMyAccount';
  static const String fingerprintUnlock = 'fingerprintUnlock';
  static const String biometricLogin = 'biometricLogin';
  static const String loginUsingBiometric = 'loginUsingBiometric';
  static const String touchBiometricSensor = 'touchBiometricSensor';
  static const String faceIDUnlock = 'faceIDUnlock';
  static const String faceIDLogin = 'faceIDLogin';
  static const String loginUsingFaceID = 'loginUsingFaceID';
  static const String placePhoneForFaceID = 'placePhoneForFaceID';
  static const String passwordReset = 'passwordReset';
  static const String letsHelpYouResetPassword = 'letsHelpYouResetPassword';
  static const String enterEmail = 'enterEmail';
  static const String sendCode = 'sendCode';
  static const String goBackToLogin = 'goBackToLogin';
  static const String enterSixDigitCode = 'enterSixDigitCode';
  static const String enterCodeSentToEmail = 'enterCodeSentToEmail';
  static const String didntGetCode = 'didntGetCode';
  static const String resendCode = 'resendCode';
  static const String passwordRequirements = 'passwordRequirements';
  static const String passwordResetSuccessful = 'passwordResetSuccessful';
  static const String more = 'more';
  static const String verified = 'verified';
  static const String haveAnIssue = 'haveAnIssue';
  static const String chatWithSupport = 'chatWithSupport';
  static const String leaderboard = 'leaderboard';
  static const String inviteFriends = 'inviteFriends';
  static const String referrals = 'referrals';
  static const String account = 'account';
  static const String personalDetails = 'personalDetails';
  static const String accountVerification = 'accountVerification';
  static const String verifyYourAccount = 'verifyYourAccount';
  static const String appearance = 'appearance';
  static const String changeAppTheme = 'changeAppTheme';
  static const String beneficiaries = 'beneficiaries';
  static const String manageBeneficiaries = 'manageBeneficiaries';
  static const String manageNotifications = 'manageNotifications';
  static const String changeLanguage = 'changeLanguage';
  static const String viewProfile = 'viewProfile';
  static const String signUp = 'signUp';
  static const String signIn = 'signIn';
  static const String english = 'english';
  static const String byClicking = 'byClicking';
  static const String and = 'and';
  static const String notNow = 'notNow';
  static const String setUp = 'setUp';
  static const String pleaseAutenticateToProceed = 'pleaseAutenticateToProceed';

  static const Map<String, dynamic> en = {
    completed: "Completed",
    byClicking: "By clicking Get started, you agree to our ",
    signUp: "Sign Up",
    and: "and ",
    signIn: "Sign In",
    no: "No",
    notNow: "Not now",
    setUp: "Set up",
    pleaseAutenticateToProceed: "'Please Authenticate to proceed'",
    english: "English",
    forgetPassword: "Forgot Password?",
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
    exploreProperties: "Explore Properties",
    smartRealEstateInvesting: "Smart Real Estate Investing",
    ownAPieceOfRealEstate: "Own a piece of prime real estate with ease. Invest in high-value properties without the hassle of traditional ownership.",
    passiveIncomeMadeSimple: "Passive Income, Made Simple",
    earnConsistentReturns: "Earn consistent returns through rental income and property appreciation. Your investments work for you while we handle the management.",
    startWithJust100: "Start with Just \$100",
    noLargeDownPayments: "No large down payments or complex paperwork—get started today and build your real estate portfolio effortlessly.",
    join: "Join ",
    propertyStake: "Property Stake",
    enterPassword: "Enter Password",
    termsOfService: "Terms of Service",
    privacyPolicy: "Privacy Policy",
    verifyCode: "Verify Code",
    enterVerificationCode: "Enter the verification code sent to your email.",
    verificationCode: "Verification Code",
    confirm: "Confirm",
    didntReceiveCode: "Didn't receive code?",
    biometricVerificationSetup: "Biometric Verification Setup",
    enableBiometricVerification: "Enable biometric verification for faster and safer logins.",
    fingerprintSetup: "Fingerprint Setup",
    placeFingerOnSensor: "Place your finger on the sensor to begin.",
    hurray: "Hurray!",
    accountCreatedSuccessfully: "Account created successfully",
    accessMyAccount: "Access my Account",
    fingerprintUnlock: "Fingerprint Unlock",
    biometricLogin: "Biometric Login",
    loginUsingBiometric: "Login using biometric",
    touchBiometricSensor: "Touch the Biometric Sensor",
    faceIDUnlock: "Face ID Unlock",
    faceIDLogin: "Face ID Login",
    loginUsingFaceID: "Login using Face ID",
    placePhoneForFaceID: "Please place your phone in front of your face to log in",
    passwordReset: "Password Reset",
    letsHelpYouResetPassword: "Let's help you get back on board",
    enterEmail: "Enter email linked to your account",
    sendCode: "Send Code",
    goBackToLogin: "Go back to Login",
    enterSixDigitCode: "Enter 6-digit code",
    enterCodeSentToEmail: "Enter the code we sent to your email",
    didntGetCode: "Didn't get code?",
    resendCode: "Resend Code",
    passwordRequirements: "Should contain a minimum of 8 characters including 1 uppercase, 1 lowercase, and 1 digit number.",
    passwordResetSuccessful: "Password Reset Successful",
    more: "More",
    verified: "Verified",
    haveAnIssue: "Have an issue or feedback?",
    chatWithSupport: "Chat with our customer support",
    leaderboard: "Leaderboard",
    inviteFriends: "Invite your friends to join",
    referrals: "Referrals",
    account: "Account",
    personalDetails: "Personal details and more",
    accountVerification: "Account Verification",
    verifyYourAccount: "Verify your account",
    appearance: "Appearance",
    changeAppTheme: "Change your app theme",
    beneficiaries: "Beneficiaries",
    manageBeneficiaries: "Add and manage beneficiary accounts",
    manageNotifications: "Manage push notifications, emails",
    changeLanguage: "Change your language preference",
    viewProfile: "View Profile"

  };

}

