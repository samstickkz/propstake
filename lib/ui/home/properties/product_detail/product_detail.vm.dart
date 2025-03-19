import 'dart:math' show Random;

import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/properties/product_detail/product_detail.ui.dart';
import 'package:propstake/ui/home/properties/properies.vm.dart';

import '../../../../utils/constants.dart';
import '../../../../widget/price_widget.dart';
import '../../cart/cart_ui.dart';
import '../../my_investment/faq_details/faq_detail_page.dart';
import '../../profile/profile_home.vm.dart';

class ProductDetailViewModel extends BaseViewModel {

  TempProperties? property;

  init(TempProperties properti){
    property = properti;
    notifyListeners();
  }

  saveUnsavedProperties(TempProperties property) async {
    await userService.saveUnSaveBookMark(property);
    notifyListeners();
  }

  String generateRandomChatId() {
    const allowedChars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    const allowedSymbols = '!@#\$%^&*()-_=+[]{};:<>,.?/';

    final firstPart = String.fromCharCodes(List.generate(5, (_) => allowedChars.codeUnitAt(Random().nextInt(allowedChars.length))));
    final middlePart = String.fromCharCodes(List.generate(23, (_) => Random().nextBool() ? allowedChars.codeUnitAt(Random().nextInt(allowedChars.length)) : allowedSymbols.codeUnitAt(Random().nextInt(allowedSymbols.length))));
    final lastPart = String.fromCharCodes(List.generate(2, (_) => allowedChars.codeUnitAt(Random().nextInt(allowedChars.length))));

    return firstPart + middlePart + lastPart;
  }

  addToCart(List<String> amounts) async {
    await userService.saveCart(
      TempCart(
        id: generateRandomChatId(),
        amountSelected: currentPrice??"",
        product: property!,
        amounts: amounts
      )
    );
    notifyListeners();

    navigationService.navigateToRoute(CartScreen());
  }

  goToPropertyDetail(int index){
    navigationService.navigateToRoute(ProductDetailScreen(property: userService.bookMarks[index],));
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