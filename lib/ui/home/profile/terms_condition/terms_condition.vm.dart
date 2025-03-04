import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/string_extensions.dart';

class TermsAndConditionViewModel extends BaseViewModel {

  List<TermsModel> terms = [
    TermsModel(
      title: LocaleData.introduction.convertString(),
      point: [
        LocaleData.welcomeToThePropStake.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.eligibility.convertString(),
      point: [
        LocaleData.userMustBeAtLeast18.convertString(),
        LocaleData.byUsingTheAppYouConfirm.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.accountRegistration.convertString(),
      point: [
        LocaleData.userMustProvideAccurateAndUpToDate.convertString(),
        LocaleData.theSecurityOfAccountCredentialIsTheUser.convertString(),
        LocaleData.theCompanyReservesTheRightToSuspend.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.investmentTerms.convertString(),
      point: [
        LocaleData.userCanInvestInPropertiesListed.convertString(),
        LocaleData.investmentAreSubjectToAvailability.convertString(),
        LocaleData.returnsOnInvestmentAreGoverned.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.paymentsAndWithdrawals.convertString(),
      point: [
        LocaleData.allFinancialTransactionsWithinTheApp.convertString(),
        LocaleData.usersMayAttributeTheirEarningsBasedOnTheTerms.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.userResponsibility.convertString(),
      point: [
        LocaleData.usersShallNotUseTheAppFoIllegal.convertString(),
        LocaleData.anyAttemptToManipulateHackOrDisrupt.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.privacyPolicy.convertString(),
      point: [
        LocaleData.theAppCollectsAndProcessesUserData.convertString(),
        LocaleData.byUsingTheAppYouConsentToTheCOllection.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.limitationOfLiability.convertString(),
      point: [
        LocaleData.theCompanyShallNotBeLiableForAnyLosses.convertString(),
        LocaleData.usersAcknowledgeThatInvestmentsCarryInherentRisk.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.termination.convertString(),
      point: [
        LocaleData.theCompanyReserveTheRightToTerminateUserAccounts.convertString(),
        LocaleData.usersMayDeleteTheirAccountsAtAnyTimeByFollowing.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.changesToTerms.convertString(),
      point: [
        LocaleData.theCompanyMayUpdateTheseTermsAnytime.convertString(),
        LocaleData.continuedUseOfTheAppAfterImplementingChanges.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.governingLaw.convertString(),
      point: [
        LocaleData.theseTermsShallBeGovernedByAndConstructed.convertString(),
      ]
    ),
    TermsModel(
      title: LocaleData.contactInformation.convertString(),
      point: [
        LocaleData.forAnyQuestionsOrConcernsRegardingTheseTerms.convertString(),
      ]
    ),
    TermsModel(
      title: "",
      point: [
        LocaleData.byUsingTheProStakeAppYouAcknowledge.convertString(),
      ]
    ),



  ];

}

class TermsModel {
  String title;
  List<String> point;

  TermsModel({required this.title, required this.point});
}