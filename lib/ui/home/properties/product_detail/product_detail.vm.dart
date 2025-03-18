import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/properties/properies.vm.dart';

import '../../../../utils/constants.dart';
import '../../../../widget/price_widget.dart';
import '../../my_investment/faq_details/faq_detail_page.dart';
import '../../profile/profile_home.vm.dart';

class ProductDetailViewModel extends BaseViewModel {

  TempProperties? property;

  init(TempProperties properti){
    property = properti;
    notifyListeners();
  }

  int currentIndex = 0;
  onChangeIndex(int index) async{
    currentIndex = index;
    notifyListeners();
  }

  String? currentPrice;

  onchange(String? value){
    currentPrice = value;
    notifyListeners();
  }

  goFaqDetail(FaqModel faq)async {
    navigationService.navigateToRoute(FaqDetailPage(faq: faq,));
  }

  List<String> divideInto15(num number, Currency currency) {
    List<String> result = [];
    int step = (number / 15).floor(); // Ensure integer division

    for (int i = step; i <= number; i += step) {
      result.add("${getCurrencySymbol(currency)} $i");
    }

    return result;
  }

}