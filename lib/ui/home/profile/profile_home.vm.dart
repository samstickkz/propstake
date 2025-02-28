import 'package:flutter/cupertino.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/string_extensions.dart';

import '../../base/base-vm.dart';
import 'about_us/about_us.ui.dart';
import 'contact_us/contact_us.ui.dart';
import 'faq/faq.ui.dart';
import 'my_account/my_account.ui.dart';
import 'security/security.ui.dart';
import 'settings/settings.ui.dart';
import 'terms_condition/terms_condition.ui.dart';

class ProfileHomeViewModel extends BaseViewModel {

  goToSettings(){
    navigationService.navigateToRoute(SettingsScreen());
  }

  goToFAQ(){
    navigationService.navigateToRoute(FAQScreen());
  }

  goToContactUs(){
    navigationService.navigateToRoute(ContactUsScreen());
  }

  goToTermsAndCondition(){
    navigationService.navigateToRoute(TermsAndConditionScreen());
  }

  goToAboutUs(){
    navigationService.navigateToRoute(AboutUsScreen());
  }

  goToMyAccount(){
    navigationService.navigateToRoute(MyAccountScreen());
  }

  goToSecurity(){
    navigationService.navigateToRoute(SecurityScreen());
  }

  
  List<FaqModel> faqs = [
    FaqModel(title: LocaleData.faqQuestion1.convertString(), body: LocaleData.faqAnswer1.convertString()),
    FaqModel(title: LocaleData.faqQuestion2.convertString(), body: LocaleData.faqAnswer1.convertString()),
    FaqModel(title: LocaleData.faqQuestion3.convertString(), body: LocaleData.faqAnswer1.convertString()),
    FaqModel(title: LocaleData.faqQuestion4.convertString(), body: LocaleData.faqAnswer1.convertString()),
  ];

  onChange(int index){
    faqs[index].changeOpenState();
    notifyListeners();
  }

}

class FaqModel with ChangeNotifier {
  String title;
  String body;
  bool isOpen;

  FaqModel({required this.title, required this.body, this.isOpen = false });

  changeOpenState(){
    isOpen = !isOpen;
    notifyListeners();
  }
}