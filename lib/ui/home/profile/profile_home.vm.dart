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

  delayFirst(){
    Future.delayed(Duration(milliseconds: 200), (){
      goToMyAccount();
    });
  }

  goToMyAccount(){
    navigationService.navigateToRoute(MyAccountScreen());
  }

  goToSecurity(){
    navigationService.navigateToRoute(SecurityScreen());
  }

  init(){
    getUser();
  }
  
  List<FaqModel> faqs = [
    FaqModel(title: LocaleData.faqQuestion1.convertString(), body: LocaleData.faqAnswer1.convertString()),
    FaqModel(title: LocaleData.faqQuestion2.convertString(), body: LocaleData.faqAnswer2.convertString()),
    FaqModel(title: LocaleData.faqQuestion3.convertString(), body: LocaleData.faqAnswer3.convertString()),
    FaqModel(title: LocaleData.faqQuestion4.convertString(), body: LocaleData.faqAnswer4.convertString()),
    FaqModel(title: LocaleData.faqQuestion5.convertString(), body: LocaleData.faqAnswer5.convertString()),
    FaqModel(title: LocaleData.faqQuestion6.convertString(), body: LocaleData.faqAnswer6.convertString()),
    FaqModel(title: LocaleData.faqQuestion7.convertString(), body: LocaleData.faqAnswer7.convertString()),
    FaqModel(title: LocaleData.faqQuestion8.convertString(), body: LocaleData.faqAnswer8.convertString()),
    FaqModel(title: LocaleData.faqQuestion9.convertString(), body: LocaleData.faqAnswer9.convertString()),
    FaqModel(title: LocaleData.faqQuestion10.convertString(), body: LocaleData.faqAnswer10.convertString()),
    FaqModel(title: LocaleData.faqQuestion11.convertString(), body: LocaleData.faqAnswer11.convertString()),
    FaqModel(title: LocaleData.faqQuestion12.convertString(), body: LocaleData.faqAnswer12.convertString()),
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