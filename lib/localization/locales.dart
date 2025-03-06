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
  static const String pleaseAutenticateToProceed = 'pleaseAutenticateToProceed';
  static const String setUp = 'setUp';
  static const String profile = 'profile';
  static const String reward = 'reward';
  static const String myInvestment = 'myInvestment';
  static const String wallet = 'wallet';
  static const String properties = 'properties';
  static const String myAccount = 'myAccount';
  static const String securityPrivacyPolicy = 'securityPrivacyPolicy';
  static const String aboutUs = 'aboutUs';
  static const String termsConditions = 'termsConditions';
  static const String contactUs = 'contactUs';
  static const String faq = 'faq';
  static const String investmentLimit = 'investmentLimit';
  static const String address = 'address';
  static const String totalInvestment = 'totalInvestment';
  static const String availableToInvest = 'availableToInvest';
  static const String estimatedROI5Years = 'estimatedROI5Years';
  static const String estimatedROI10Years = 'estimatedROI10Years';
  static const String availableROI = 'availableROI';
  static const String investmentRenewalInfo = 'investmentRenewalInfo';
  static const String professionalInvestorInfo = 'professionalInvestorInfo';
  static const String loremIpsumPlaceholder = 'loremIpsumPlaceholder';
  static const String yourName = 'yourName';
  static const String yourMessage = 'yourMessage';
  static const String messageSent = 'messageSent';
  static const String done = 'done';
  static const String faqQuestion1 = 'faqQuestion1';
  static const String faqAnswer1 = 'faqAnswer1';
  static const String faqQuestion2 = 'faqQuestion2';
  static const String faqQuestion3 = 'faqQuestion3';
  static const String faqQuestion4 = 'faqQuestion4';
  static const String logoutPrompt = 'logoutPrompt';
  static const String chooseYourCurrency = 'chooseYourCurrency';
  static const String chooseYourLanguage = 'chooseYourLanguage';
  static const String pushNotification = 'pushNotification';
  static const String notificationSettings = 'notificationSettings';
  static const String currency = 'currency';
  static const String appLanguage = 'appLanguage';
  static const String getTimelyNewFeatureUpdate = 'getTimelyNewFeatureUpdate';
  static const String productUpdates = 'productUpdates';
  static const String trackTheProgressOfProperties = 'trackTheProgressOfProperties';
  static const String investmentUpdates = 'investmentUpdates';
  static const String beInTheKnowAboutNewProperty = 'beInTheKnowAboutNewProperty';
  static const String propertyLaunches = 'propertyLaunches';
  static const String upgrade = 'upgrade';
  static const String howCanWeHelpYou = 'howCanWeHelpYou';
  static const String biometricAuthentication = 'biometricAuthentication';
  static const String realInvestor = 'realInvestor';
  static const String socialLogin = 'socialLogin';
  static const String noActiveSocialLogin = 'noActiveSocialLogin';
  static const String introduction = 'introduction';
  static const String welcomeToThePropStake = 'welcomeToThePropStake';
  static const String eligibility = 'eligibility';
  static const String userMustBeAtLeast18 = 'userMustBeAtLeast18';
  static const String byUsingTheAppYouConfirm = 'byUsingTheAppYouConfirm';
  static const String theSecurityOfAccountCredentialIsTheUser = 'theSecurityOfAccountCredentialIsTheUser';
  static const String userMustProvideAccurateAndUpToDate = 'userMustProvideAccurateAndUpToDate';
  static const String accountRegistration = 'accountRegistration';
  static const String theCompanyReservesTheRightToSuspend = 'theCompanyReservesTheRightToSuspend';
  static const String investmentTerms = 'investmentTerms';
  static const String userCanInvestInPropertiesListed = 'userCanInvestInPropertiesListed';
  static const String investmentAreSubjectToAvailability = 'investmentAreSubjectToAvailability';
  static const String returnsOnInvestmentAreGoverned = 'returnsOnInvestmentAreGoverned';
  static const String byUsingTheProStakeAppYouAcknowledge = 'byUsingTheProStakeAppYouAcknowledge';
  static const String byUsingTheAppYouConsentToTheCOllection = 'byUsingTheAppYouConsentToTheCOllection';
  static const String theAppCollectsAndProcessesUserData = 'theAppCollectsAndProcessesUserData';
  static const String anyAttemptToManipulateHackOrDisrupt = 'anyAttemptToManipulateHackOrDisrupt';
  static const String usersShallNotUseTheAppFoIllegal = 'usersShallNotUseTheAppFoIllegal';
  static const String userResponsibility = 'userResponsibility';
  static const String usersMayAttributeTheirEarningsBasedOnTheTerms = 'usersMayAttributeTheirEarningsBasedOnTheTerms';
  static const String allFinancialTransactionsWithinTheApp = 'allFinancialTransactionsWithinTheApp';
  static const String paymentsAndWithdrawals = 'paymentsAndWithdrawals';
  static const String continuedUseOfTheAppAfterImplementingChanges = 'continuedUseOfTheAppAfterImplementingChanges';
  static const String theCompanyMayUpdateTheseTermsAnytime = 'theCompanyMayUpdateTheseTermsAnytime';
  static const String changesToTerms = 'changesToTerms';
  static const String usersMayDeleteTheirAccountsAtAnyTimeByFollowing = 'usersMayDeleteTheirAccountsAtAnyTimeByFollowing';
  static const String theCompanyReserveTheRightToTerminateUserAccounts = 'theCompanyReserveTheRightToTerminateUserAccounts';
  static const String termination = 'termination';
  static const String usersAcknowledgeThatInvestmentsCarryInherentRisk = 'usersAcknowledgeThatInvestmentsCarryInherentRisk';
  static const String theCompanyShallNotBeLiableForAnyLosses = 'theCompanyShallNotBeLiableForAnyLosses';
  static const String limitationOfLiability = 'limitationOfLiability';
  static const String forAnyQuestionsOrConcernsRegardingTheseTerms = 'forAnyQuestionsOrConcernsRegardingTheseTerms';
  static const String contactInformation = 'contactInformation';
  static const String theseTermsShallBeGovernedByAndConstructed = 'theseTermsShallBeGovernedByAndConstructed';
  static const String governingLaw = 'governingLaw';
  static const String searchForProperties = 'searchForProperties';
  static const String favouriteProperies = 'favouriteProperies';
  static const String bedsNumber = 'bedsNumber';
  static const String fullyFunded = 'fullyFunded';
  static const String latestListing = 'latestListing';
  static const String update = 'update';
  static const String hi = 'hi';
  static const String fullName = 'fullName';
  static const String percentageFunded = 'percentageFunded';
  static const String dateOfBirth = 'dateOfBirth';
  static const String organisation = 'organisation';
  static const String selectDateOfBirth = 'selectDateOfBirth';
  static const String updatePassword = 'updatePassword';
  static const String enterNewPassword = 'enterNewPassword';
  // static const String selectDateOfBirth = 'selectDateOfBirth';
  static const String enterYourEmailWeWillSend = 'enterYourEmailWeWillSend';
  static const String troubleLoginIn = 'troubleLoginIn';

  static const Map<String, dynamic> en = {
    completed: "Completed",
    organisation: "Organisation",
    updatePassword: "Update password",
    enterNewPassword: "New Password",
    enterYourEmailWeWillSend: "Enter your email address and we’ll send you a \nlink to help you get back into your account",
    // organisation: "Organisation",
    troubleLoginIn: "Trouble Logging In?",
    favouriteProperies: "Favorite Properties",
    bedsNumber: "%a Beds",
    percentageFunded: "%a% Funded",
    fullyFunded: "Fully Funded",
    latestListing: "Latest Listings",
    update: "Update",
    fullName: "Full Name",
    dateOfBirth: "Date of Birth",
    selectDateOfBirth: "Select Date of Birth",
    searchForProperties: "Search for properties",
    hi: "Hi %a",
    forAnyQuestionsOrConcernsRegardingTheseTerms: "For any questions or concerns regarding these Terms, please contact us at [Support Email].",
    contactInformation: "CONTACT INFORMATION",
    theseTermsShallBeGovernedByAndConstructed: "These Terms shall be governed by and construed by the laws of [Jurisdiction].",
    governingLaw: "GOVERNING LAW",
    continuedUseOfTheAppAfterImplementingChanges: "Continued use of the App after implementing changes constitutes acceptance of the updated Terms.",
    theCompanyMayUpdateTheseTermsAnytime: "The Company may update these Terms anytime, with notice provided via the App.",
    changesToTerms: "CHANGES TO TERMS",
    usersMayDeleteTheirAccountsAtAnyTimeByFollowing: "Users may delete their accounts at any time by following the provided procedures",
    theCompanyReserveTheRightToTerminateUserAccounts: "The Company reserves the right to terminate user accounts for violations of these Terms.",
    termination: "TERMINATION",
    usersAcknowledgeThatInvestmentsCarryInherentRisk: "Users acknowledge that investments carry inherent risks and that past performance does not guarantee future returns.",
    theCompanyShallNotBeLiableForAnyLosses: "The Company shall not be liable for any losses or damages resulting from the use of the App, including but not limited to investment losses.",
    limitationOfLiability: "LIMITATION OF LIABILITY",
    byUsingTheAppYouConsentToTheCOllection: "By using the App, you consent to the collection and use of your data as described in the Privacy Policy.",
    theAppCollectsAndProcessesUserData: "The App collects and processes user data in accordance with our Privacy Policy.",
    anyAttemptToManipulateHackOrDisrupt: "Any attempt to manipulate, hack, or disrupt the App’s services will result in immediate termination.",
    usersShallNotUseTheAppFoIllegal: "Users shall not use the App for illegal or fraudulent activities.",
    userResponsibility: "USER RESPONSIBILITIES",
    usersMayAttributeTheirEarningsBasedOnTheTerms: "Users may withdraw their earnings based on the terms outlined in their investment agreements.",
    allFinancialTransactionsWithinTheApp: "All financial transactions within the App shall be processed through approved payment gateways.",
    paymentsAndWithdrawals: "PAYMENTS AND WITHDRAWALS",
    upgrade: "Upgrade",
    introduction: "introduction",
    eligibility: "Eligibility",
    byUsingTheProStakeAppYouAcknowledge: "By using the PropStake App, you acknowledge that you have read, understood, and agreed to these Terms and Conditions.",
    returnsOnInvestmentAreGoverned: "Returns on investment are governed by separate investment agreements.",
    investmentAreSubjectToAvailability: "Investments are subject to availability and acceptance by PropStake.",
    userCanInvestInPropertiesListed: "Users can invest in properties listed within the App.",
    investmentTerms: "INVESTMENT TERMS",
    theCompanyReservesTheRightToSuspend: "The Company reserves the right to suspend or terminate accounts for violations of these Terms.",
    theSecurityOfAccountCredentialIsTheUser: "The security of account credentials is the user’s responsibility.",
    userMustProvideAccurateAndUpToDate: "Users must provide accurate and up-to-date information during registration.",
    accountRegistration: "ACCOUNT REGISTRATION",
    byUsingTheAppYouConfirm: "By using the App, you confirm that you meet the eligibility requirements.",
    userMustBeAtLeast18: "Users must be at least 18 years old to register and invest",
    welcomeToThePropStake: "Welcome to the PropStake mobile application (\"App\"). By downloading, accessing, or using this App, you agree to be bound by these Terms and Conditions (\"Terms\"). If you do not agree to these Terms, please do not use the App.",
    noActiveSocialLogin: "No active social logins",
    socialLogin: "Social logins",
    biometricAuthentication: "Biometric authentication",
    howCanWeHelpYou: "How can we help you?",
    getTimelyNewFeatureUpdate: "Get timely new feature update of our App ",
    productUpdates: "Product updates",
    trackTheProgressOfProperties: "Track the progress of properties in your portfolio",
    investmentUpdates: "Investment updates",
    beInTheKnowAboutNewProperty: "Be in the know about new property launches globally.",
    propertyLaunches: "Property Launches",
    currency: "Currency",
    realInvestor: "Retail Investor",
    notificationSettings: "Notification Settings",
    pushNotification: "Push notification",
    chooseYourLanguage: "Choose your language",
    chooseYourCurrency: "Choose your currency",
    appLanguage: "App language",
    byClicking: "By clicking Get started, you agree to our ",
    signUp: "Sign Up",
    and: "and ",
    profile: "Profile",
    reward: "Reward",
    myInvestment: "My Investment",
    wallet: "Wallet",
    properties: "Properties",
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
    viewProfile: "View Profile",
    myAccount: "My account",
    securityPrivacyPolicy: "Security & Privacy Policy",
    aboutUs: "About us",
    termsConditions: "Terms & conditions",
    contactUs: "Contact us",
    faq: "FAQ",
    investmentLimit: "Investment Limit",
    address: "Your address",
    totalInvestment: "Total investment: \$200",
    availableToInvest: "Available to invest: \$1000",
    estimatedROI5Years: "Total Estimated ROI in 5 years: \$1000",
    estimatedROI10Years: "Total Estimated ROI in 10 years: \$1000",
    availableROI: "Available ROI: \$20",
    investmentRenewalInfo: "Your annual investment limit will renew on 1st January 2026.",
    professionalInvestorInfo: "To upgrade to a professional investor, you need assets over USD 1 million. Contact support to start the process and gain unlimited investment access with credit card funding.",
    loremIpsumPlaceholder: "Lorem ipsum dolor sit amet consectetur. Rutrum elementum vis et sit quis vitae.",
    yourName: "Your name",
    yourMessage: "Your message",
    messageSent: "Message sent",
    done: "Done",
    faqQuestion1: "What is the purpose of the investment limit?",
    faqAnswer1: "The investment limit ensures compliance with financial regulations and responsible investing. It helps protect investors while maintaining platform integrity.",
    faqQuestion2: "How is my investment limit calculated?",
    faqQuestion3: "When does my annual investment limit reset?",
    faqQuestion4: "Can I increase my investment limit?",
    logoutPrompt: "Log out of your account?",


  };

}

