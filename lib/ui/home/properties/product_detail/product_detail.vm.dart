import 'dart:convert';
import 'dart:math' show Random;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:propstake/data/model/propert_response.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/properties/product_detail/product_detail.ui.dart';
import 'package:propstake/ui/home/properties/properies.vm.dart';
import 'package:propstake/utils/string_extensions.dart';

import '../../../../utils/app_logger.dart';
import '../../../../utils/constants.dart';
import '../../../../widget/price_widget.dart';
import '../../cart/cart_ui.dart';
import '../../my_investment/faq_details/faq_detail_page.dart';
import '../../profile/profile_home.vm.dart';

class ProductDetailViewModel extends BaseViewModel {

  saveUnsavedProperties(PropertyResponse property) async {
    await userService.saveUnSaveBookMark(property);
    notifyListeners();
  }



  addToCart(PropertyResponse property) async {
    startLoader();
    await walletService.addCartItem(currentPrice: currentPrice.text.trim(), property: property!).then((val) async {
      if(val){
        await walletService.fetchCarts();
      }
    });
    stopLoader();
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

  TextEditingController currentPrice = TextEditingController();

  onchange(String? value){
    formKey.currentState!.validate();
    notifyListeners();
  }

  String? validator(String? value, PropertyResponse property){
    if(currentPrice.text.trim().isEmpty){
      return LocaleData.emptyField.convertString();
    }
    if(num.tryParse(currentPrice.text.trim()) == null){
      return "Value must be a number";
    }
    if(num.parse(currentPrice.text.trim()) == 0){
      return "Value must be a greater than zero";
    }
    if(num.parse(currentPrice.text.trim()) > ((property.totalCost?? 0) -( property.amountFunded??0))){
      return "Value must be less than or equal to ${((property.totalCost?? 0) -( property.amountFunded??0))}";
    }
    return null;
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