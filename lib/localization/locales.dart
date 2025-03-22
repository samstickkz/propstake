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
  static const String faqAnswer11 = 'faqAnswer11';
  static const String faqAnswer12 = 'faqAnswer12';
  static const String faqAnswer10 = 'faqAnswer10';
  static const String faqAnswer2 = 'faqAnswer2';
  static const String faqAnswer3 = 'faqAnswer3';
  static const String faqAnswer4 = 'faqAnswer4';
  static const String faqAnswer5 = 'faqAnswer5';
  static const String faqAnswer6 = 'faqAnswer6';
  static const String faqAnswer7 = 'faqAnswer7';
  static const String faqAnswer8 = 'faqAnswer8';
  static const String faqAnswer9 = 'faqAnswer9';
  static const String faqQuestion2 = 'faqQuestion2';
  static const String faqQuestion3 = 'faqQuestion3';
  static const String faqQuestion4 = 'faqQuestion4';
  static const String faqQuestion5 = 'faqQuestion5';
  static const String faqQuestion6 = 'faqQuestion6';
  static const String faqQuestion7 = 'faqQuestion7';
  static const String faqQuestion8 = 'faqQuestion8';
  static const String faqQuestion9 = 'faqQuestion9';
  static const String faqQuestion10 = 'faqQuestion10';
  static const String faqQuestion11 = 'faqQuestion11';
  static const String faqQuestion12 = 'faqQuestion12';
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
  static const String myPortfolio = 'myPortfolio';
  static const String enterYourEmailWeWillSend = 'enterYourEmailWeWillSend';
  static const String troubleLoginIn = 'troubleLoginIn';
  static const String frequentlyAskedQuestion = 'frequentlyAskedQuestion';
  static const String seeAll = 'seeAll';
  static const String transactionHistory = 'transactionHistory';
  static const String withdraw = 'withdraw';
  static const String deposit = 'deposit';
  static const String recent = 'recent';
  static const String invest = 'invest';
  static const String totalBalance = 'totalBalance';
  static const String bankTransfer = 'bankTransfer';
  static const String chooseAPaymentMethodThatWorksBestForYou = 'chooseAPaymentMethodThatWorksBestForYou';
  static const String chooseAPlanAndLetsHandleTheRest = 'chooseAPlanAndLetsHandleTheRest';
  static const String autoInvest = 'autoInvest';
  static const String accountNumber = 'accountNumber';
  static const String accountName = 'accountName';
  static const String amount = 'amount';
  static const String enterYourBankDetailsToReceivePayment = 'enterYourBankDetailsToReceivePayment';
  static const String iHaveMadeTheTransfer = 'iHaveMadeTheTransfer';
  static const String createHereAfterYouHaveMadeATransfer = 'createHereAfterYouHaveMadeATransfer';
  static const String addMemoPleaseAddMemoToTheTransaction = 'addMemoPleaseAddMemoToTheTransaction';
  static const String bankName = 'bankName';
  static const String copiedToClipboard = 'copiedToClipboard';
  static const String older = 'older';
  static const String yuan = 'yuan';
  static const String gbp = 'gbp';
  static const String eur = 'eur';
  static const String ngn = 'ngn';
  static const String usd = 'usd';
  static const String copyDetailsAndMakePayment = 'copyDetailsAndMakePayment';
  static const String accountDetails = 'accountDetails';
  static const String comingSoon = 'comingSoon';
  static const String clickHereAfterYouMakeTheTransfer = 'clickHereAfterYouMakeTheTransfer';
  static const String transferFundsFromYourLocalOrInternationalBankAccounts = 'transferFundsFromYourLocalOrInternationalBankAccounts';
  static const String browseThroughAVarietyOfProperties = 'browseThroughAVarietyOfProperties';
  static const String aboutTiers = 'aboutTiers';
  static const String journeyToEliteRewards = 'journeyToEliteRewards';
  static const String bronzeTier = 'bronzeTier';
  static const String silverTier = 'silverTier';
  static const String goldTier = 'goldTier';
  static const String platinumTier = 'platinumTier';
  static const String amountInvested = 'amountInvested';
  static const String investToReach = 'investToReach';
  static const String benefits = 'benefits';
  static const String cashbackOnInvestments = 'cashbackOnInvestments';
  static const String basicSupport = 'basicSupport';
  static const String prioritySupport = 'prioritySupport';
  static const String referralBonusBoost = 'referralBonusBoost';
  static const String higherCashbackReturns = 'higherCashbackReturns';
  static const String premiumSupport = 'premiumSupport';
  static const String earlyAccessToNewDeals = 'earlyAccessToNewDeals';
  static const String enhancedReferralRewards = 'enhancedReferralRewards';
  static const String howToUpgrade = 'howToUpgrade';
  static const String investMore = 'investMore';
  static const String joinPromotions = 'joinPromotions';
  static const String myEarnings = 'myEarnings';
  static const String cashback = 'cashback';
  static const String promotions = 'promotions';
  static const String referAndEarn = 'referAndEarn';
  static const String shareUniqueCode = 'shareUniqueCode';
  static const String howToEarnMore = 'howToEarnMore';
  static const String investingInNewProperties = 'investingInNewProperties';
  static const String invitingFriends = 'invitingFriends';
  static const String participatingInPromotions = 'participatingInPromotions';
  static const String settingUpAutoInvestPlans = 'settingUpAutoInvestPlans';
  static const String yourJourneyToEliteReward = 'yourJourneyToEliteReward';
  static const String discoverHowYourTierSystem = 'discoverHowYourTierSystem';
  static const String getStartedWithBasicBenefitsAsYouBegin = 'getStartedWithBasicBenefitsAsYouBegin';
  static const String enjoyIncreasedCashBackAndBetter = 'enjoyIncreasedCashBackAndBetter';
  static const String accessEarlyPropertyDealsPriority = 'accessEarlyPropertyDealsPriority';
  static const String unlockTopTierBenefitsIncludingPersonalizedAdvice = 'unlockTopTierBenefitsIncludingPersonalizedAdvice';
  static const String basicSupportInfo = 'basicSupportInfo';
  static const String cashbackOnInvestmentsInfo = 'cashbackOnInvestmentsInfo';
  static const String prioritySupportInfo = 'prioritySupportInfo';
  static const String referralBonusBoostInfo = 'referralBonusBoostInfo';
  static const String higherCashbackReturnsInfo = 'higherCashbackReturnsInfo';
  static const String premiumSupportInfo = 'premiumSupportInfo';
  static const String earlyAccessToNewDealsInfo = 'earlyAccessToNewDealsInfo';
  static const String enhancedReferralRewardsInfo = 'enhancedReferralRewardsInfo';
  static const String startInvestingToUpgradeYourTier = 'startInvestingToUpgradeYourTier';
  static const String amountToBeInvestedIn12Months = 'amountToBeInvestedIn12Months';
  static const String toReach = 'toReach';
  static const String investedAbove = 'investedAbove';
  static const String referralNumber = 'referralNumber';
  static const String spreadTheWordAboutProstake = 'spreadTheWordAboutProstake';
  static const String amountRequiredToUpgrade = 'amountRequiredToUpgrade';
  static const String inviteFriend = 'inviteFriend';
  static const String referralCodeCopped = 'referralCodeCopped';
  static const String rented = 'rented';
  static const String sale = 'sale';
  static const String fiveYearTotalReturn = 'fiveYearTotalReturn';
  static const String yearlyReturns = 'yearlyReturns';
  static const String takeATour = 'takeATour';
  static const String investors = 'Investors';
  static const String remainingInvestmentAmount = 'remainingInvestmentAmount';
  static const String cartAmount = 'cartAmount';
  static const String remove = 'remove';
  static const String addProperties = 'addProperties';
  static const String checkOut = 'checkOut';
  static const String addToCart = 'addToCart';
  static const String favouriteProperties = 'favouriteProperties';
  static const String yourSavedPropertiesAtAGlance = 'yourSavedPropertiesAtAGlance';
  static const String selectAmount = 'selectAmount';
  static const String propertyAlreadyInCart = 'propertyAlreadyInCart';
  static const String propertyAddedToCart = 'propertyAddedToCart';
  static const String aboutUsInfo = 'aboutUsInfo';
  static const String prostakeYourGatewayToSmart = 'prostakeYourGatewayToSmart';
  static const String contactUsOnWhatsapp = 'contactUsOnWhatsapp';
  static const String referralCode = 'referralCode';
  static const String enterReferralCode = 'enterReferralCode';


  static const Map<String, dynamic> en = {
    completed: "Completed",
    referralCode: "Referral Code",
    enterReferralCode: "Enter Referral Code",
    contactUsOnWhatsapp: "Contact Us on Whatsapp",
    propertyAlreadyInCart: "Property already in cart go to Cart to update",
    propertyAddedToCart: "Property added to cart",
    selectAmount: "Select Amount",
    addToCart: "Add to Cart",
    takeATour: "Tour the Property",
    rented: "Rented",
    prostakeYourGatewayToSmart: "PropStake – Your Gateway to Smart Real Estate Investment.",
    favouriteProperties: "Favorite Properties",
    yourSavedPropertiesAtAGlance: "Your saved properties at a glance. Easily access and invest in your top picks.",
    investors: "Investors",
    remainingInvestmentAmount: "Remaining investment amount",
    cartAmount: "Cart(%a)",
    remove: "Remove",
    addProperties: "Add Properties",
    checkOut: "Checkout",
    sale: "Sale",
    fiveYearTotalReturn: "5 year total return",
    yearlyReturns: "Yearly return",
    referralCodeCopped: "Referral Code Copied Successfully",
    inviteFriend: "Invite Friends",
    spreadTheWordAboutProstake: "Spread the word about Propstake",
    amountRequiredToUpgrade: "\$%a investment is required to reach %a.",
    referralNumber: "%a referrals",
    investedAbove: "Invested Above",
    toReach: "to Reach ",
    yourJourneyToEliteReward: "Your Journey to Elite Rewards",
    discoverHowYourTierSystem: "Discover how our tier system works and the exclusive benefits you can unlock as you invest more with us. Your tier not only reflects your commitment but also opens the door to enhanced rewards, higher cashback, and premium support.",
    getStartedWithBasicBenefitsAsYouBegin: "Get started with basic benefits as you begin your investment journey.",
    enjoyIncreasedCashBackAndBetter: "Enjoy increased cashback and better referral bonuses to boost your portfolio.",
    accessEarlyPropertyDealsPriority: "Access early property deals, priority support, and higher rewards with every investment.",
    unlockTopTierBenefitsIncludingPersonalizedAdvice: "Unlock top-tier benefits including personalized advice, exclusive events, and maximum rewards.",
    copiedToClipboard: " Copied to clipboard",
    older: "Older",
    amountToBeInvestedIn12Months: "Amount to be invested in 12 months",
    startInvestingToUpgradeYourTier: "Start investing to upgrade your tier",
    comingSoon: "Coming Soon",
    clickHereAfterYouMakeTheTransfer: "Click here after you have made the transfer",
    yuan: "CNY",
    gbp: "GBP",
    eur: "EUR",
    ngn: "NGN",
    usd: "USD",
    organisation: "Organisation",
    recent: "Recent",
    enterYourBankDetailsToReceivePayment: "Enter your bank details to receive payment",
    iHaveMadeTheTransfer: "I have made the transfer",
    createHereAfterYouHaveMadeATransfer: "Click here after you have made the transfer",
    addMemoPleaseAddMemoToTheTransaction: "Add Memo (please add memo to the transaction)",
    bankName: "Bank Name",
    accountNumber: "Account Number",
    accountName: "Account Name",
    amount: "Amount",
    copyDetailsAndMakePayment: "Copy details and make payment",
    accountDetails: "Account details",
    transferFundsFromYourLocalOrInternationalBankAccounts: "Transfer funds from your local or international bank account directly into your wallet.",
    bankTransfer: "Bank Transfer",
    chooseAPaymentMethodThatWorksBestForYou: "Choose a payment method that works best for you.",
    chooseAPlanAndLetsHandleTheRest: "Choose a plan and let us handle the rest.",
    autoInvest: "Auto invest",
    browseThroughAVarietyOfProperties: "Browse through a variety of properties",
    frequentlyAskedQuestion: "Frequently Asked Question",
    seeAll: "See all",
    transactionHistory: "Transaction history",
    withdraw: "Withdraw",
    deposit: "Deposit",
    invest: "Invest",
    totalBalance: "Total Balance",
    updatePassword: "Update password",
    enterNewPassword: "New Password",
    enterYourEmailWeWillSend: "Enter your email address and we’ll send you a \nlink to help you get back into your account",
    myPortfolio: "My Portfolio",
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
    faqQuestion1: "What is PropStake?",
    faqQuestion2: "How does PropStake work?",
    faqQuestion3: "Who can invest with PropStake?",
    faqQuestion4: "What is the minimum deposit to invest?",
    faqQuestion5: "Can I invest multiple times?",
    faqQuestion6: "What are the benefits of investing with PropStake?",
    faqQuestion7: "How do I start investing?",
    faqQuestion8: "How secure is my investment?",
    faqQuestion9: "Can I sell my stake in a property?",
    faqQuestion10: "How are returns distributed?",
    faqQuestion11: "Are there any hidden fees?",
    faqQuestion12: "How do I contact customer support?",
    faqAnswer1: "PropStake is a real estate investment platform that allows individuals to invest in premium properties through fractional ownership. It is a product of NPJ, designed to make property investment accessible, secure, and rewarding.",
    faqAnswer2: "PropStake enables users to invest in real estate by purchasing a stake in properties. Investors earn returns from rental income and potential property appreciation over time",
    faqAnswer3: "Anyone above the legal age for investment in their country can invest in PropStake. Whether you're a first-time investor or an experienced one, our platform simplifies the process",
    faqAnswer4: "The minimum amount required to start investing with PropStake is ₦50,000. This allows investors to take their first step into real estate with a small, manageable stake.",
    faqAnswer5: "Yes! Investors can choose to invest multiple times in the same property or across different properties, increasing their stake and potential returns over time.",
    faqAnswer6: ". Affordable entry into real estate investment \n. Passive income from rental earnings\n. Portfolio diversification\n. Hassle-free property management handled by NPJ",
    faqAnswer7: "Simply sign up on our platform, browse available properties, choose your preferred investment, and purchase a stake. Your earnings will be credited periodically based on rental income and appreciation.",
    faqAnswer8: "We prioritize transparency and security. Properties are legally verified, and all transactions are recorded on a secure system to ensure accountability.",
    faqAnswer9: "Yes, PropStake allows investors to exit their investments by selling their stake to other investors or through buy-back options where applicable",
    faqAnswer10: "Earnings from rental income are distributed periodically (monthly or quarterly) based on the investor’s stake percentage. Appreciation returns are realized when a property is sold or revalued.",
    faqAnswer11: "No, we maintain a transparent fee structure. Any applicable charges, such as management or transaction fees, will be clearly outlined before you invest.",
    faqAnswer12: "You can reach our support team via email, phone, or our in-app chat feature for any inquiries or assistance.",
    logoutPrompt: "Log out of your account?",
    aboutTiers: "About Tiers",
    journeyToEliteRewards: "Your Journey to Elite Rewards",
    bronzeTier: "Bronze Tier",
    silverTier: "Silver Tier",
    goldTier: "Gold Tier",
    platinumTier: "Platinum Tier",
    amountInvested: "Amount invested in the last 12 months",
    investToReach: "Invest %a to reach %a",
    benefits: "Benefits",
    cashbackOnInvestments: "Cashback on Investments",
    basicSupport: "Basic Support",
    prioritySupport: "Priority Support",
    referralBonusBoost: "Referral Bonus Boost",
    higherCashbackReturns: "Higher Cashback Returns",
    premiumSupport: "Premium Support",
    earlyAccessToNewDeals: "Early Access to New Deals",
    enhancedReferralRewards: "Enhanced Referral Rewards",
    cashbackOnInvestmentsInfo: "Earn %a% back on every investment you make.",
    basicSupportInfo: "Get email and in-app chat support for any inquiries.",
    prioritySupportInfo: "Get faster response times from our support team, ensuring quicker assistance.",
    referralBonusBoostInfo: "Earn better referral bonuses.",
    higherCashbackReturnsInfo: "Earn a higher cashback percentage on your investments.",
    premiumSupportInfo: "Enjoy expedited responses and dedicated support channels.",
    earlyAccessToNewDealsInfo: "Get first dibs on select high-potential properties before they go public.",
    enhancedReferralRewardsInfo: "Earn boosted referral bonuses for every successful invitation.",
    howToUpgrade: "How to Upgrade",
    investMore: "Invest More",
    joinPromotions: "Join Promotions",
    myEarnings: "My Earnings",
    cashback: "Cashback",
    promotions: "Promotions",
    referAndEarn: "Refer and Earn",
    shareUniqueCode: "Share your unique code with friends to earn more!",
    howToEarnMore: "How to earn more",
    investingInNewProperties: "Investing in new properties",
    invitingFriends: "Inviting friends (referrals)",
    participatingInPromotions: "Participating in promotional events",
    settingUpAutoInvestPlans: "Setting up auto-invest plans",
    aboutUsInfo: "we believe in making real estate investment seamless, accessible, and rewarding. As a product of NPJ, we are committed to bridging the gap between property ownership and financial growth, offering individuals the opportunity to invest in premium real estate with ease. \n\nOur platform is designed to empower investors by providing fractional ownership options, transparent processes, and data-driven insights, ensuring that real estate investment is no longer limited to a select few. Whether you're a seasoned investor or just starting out, PropStake simplifies property investment, allowing you to grow your wealth with confidence.\n\nBacked by NPJ's expertise in property management and hospitality, we combine innovation with industry knowledge to deliver a secure, user-friendly, and profitable investment experience. Join us as we revolutionize real estate investment, one stake at a time.\n",


  };

}

