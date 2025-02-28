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