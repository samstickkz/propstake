import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/app_logger.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/snack_message.dart';
import 'package:propstake/utils/string_extensions.dart';

import '../../../data/model/cart_model.dart';
import '../../../data/model/propert_response.dart';
import '../../../localization/locales.dart';
import '../../../widget/success_screen.dart';
import '../bottom_nav.ui.dart';
import '../my_investment/deposit/account_details.ui.dart';
import '../properties/properies.vm.dart';

class CartViewModel extends BaseViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<TempCart> cartItems = [];
  List<TextEditingController> controllers = [];  // Add controllers list
  List<String> values = [];
  List<GlobalKey<FormState>> formKeys = [];

  String id = "";
  detailIit() async {
    id = getRandomString(24);
  }

  onChangeTap(int i){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      formKey.currentState!.validate();
      notifyListeners();
    });
  }

  onInit() async {
    startLoader();
    cartItems = await walletService.fetchCarts();

    // Initialize controllers with existing values
    controllers = List.generate(cartItems.length, (index) => TextEditingController(text: cartItems[index].amountSelected ?? ""));
    formKeys = List.generate(cartItems.length, (_) => GlobalKey<FormState>());
    values = cartItems.map((element) => element.amountSelected ?? "").toList();
    stopLoader();
    notifyListeners();
  }

  onchange(int index, String? value,) {
    if (value != null) {
      values[index] = value;
      controllers[index].text = value;  // Ensure the controller updates
    }
    formKeys[index].currentState?.validate(); // ✅ Validate with per-form key
    notifyListeners();
  }

  TextEditingController controller =  TextEditingController();
  onChanged(String? value,) {
    notifyListeners();
  }

  validator(int index, String? value){
    if(value == null || value.isEmpty){
      return LocaleData.emptyField.convertString();
    }
    if(num.tryParse(value) == null){
      return "Value must be a number";
    }
    if(num.parse(value) == 0){
      return "Value must be a greater than zero";
    }
    if(num.parse(value) > ((cartItems[index].product?.totalCost?? 0) -(cartItems[index].product?.amountFunded??0))){
      return "Value must be less than or equal to ${((cartItems[index].product?.totalCost?? 0) -(cartItems[index].product?.amountFunded??0))}";
    }
    return null;
  }

  Future<void> removeFromCart(TempCart cartId) async {
    startLoader();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    int index = cartItems.indexWhere((t)=> t.id == cartId.id);
    try {
      await firestore.collection("carts").doc(cartId.id).delete();
      cartItems  = await walletService.fetchCarts();
      values.removeAt(index);
      controllers.removeAt(index);
      stopLoader();
      notifyListeners();
    } catch (e) {
      AppLogger.debug("Error removing cart item: $e");
      stopLoader();
      notifyListeners();
    }
  }

  goToSuccess(){
    navigationService.navigateToRoute(
        SuccessScreen(
          onTap:()=> navigationService.navigateToAndRemoveUntilWidget(BottomNavigationScreen(initialIndex: 1,)),
          title: "Payment confirmed",
          body: "You payment will be confirmed and you will get a mail form us confirming your payment",
        )
    );
  }

  submit({
    PropertyResponse? property,
    required num price,
    required String paymentType,
    required String wallet,
    required String id,
  }) async {
    startLoader();
    try{
      bool res = await walletService.transaction(
        property: property,
        currentPrice: price,
        id: id,
        paymentType: paymentType,
        wallet: wallet
      );
      stopLoader();
      if(res){
        goToSuccess();
      }
    }catch (err){
      AppLogger.debug("Error o paymennt :: ${err.toString()}");
      stopLoader();
    }
  }


  checkOut(){
    // navigationService.navigateToRoute(AccountDetailScreen(cart: cartItems,));
  }

  Future<void> updateCartItem(TempCart cart) async {
    startLoader();
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection("carts").doc(cart.id).update(jsonDecode(jsonEncode(cart)));
      AppLogger.debug("Cart item updated successfully!");
    } catch (e) {
      AppLogger.debug("Error updating cart item: $e");
    }
    stopLoader();
    notifyListeners();
  }

  updateAmount(int index) async {
    cartItems[index].amountSelected = controllers[index].text;
    startLoader();
    var res = await walletService.updateCartItem(cart: cartItems[index]);
    if(res){
      await onInit();
    }
    stopLoader();
    notifyListeners();
  }

  reduceAmount(TempCart cart) async {
    int i = cartItems.indexWhere((test)=> test.id == cart.id);
    int index = cart.amounts.indexWhere((test)=> test == cart.amountSelected);
    if(index == 0){
      return;
    }else{
      cart.updateAmount(cart.amounts[index-1]);
    }
    cartItems[i] = cart;
    await updateCartItem(cart);
    notifyListeners();
  }




}