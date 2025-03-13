import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/widget/price_widget.dart';

class MyInvestHomeViewModel extends BaseViewModel {

  List<Map<String, dynamic>> myBalance = [
    {
      "title": LocaleData.totalBalance.convertString(),
      "value": 5000,
      "currency": Currency.dollar
    },
    {
      "title": "USD Balance",
      "value": 1000,
      "currency": Currency.dollar
    },
    {
      "title": "NGN Balance",
      "value": 4000*1590,
      "currency": Currency.naira
    },
  ];

}