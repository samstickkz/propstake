import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/app_logger.dart';
import 'package:propstake/utils/constants.dart';

import '../../../data/model/cart_model.dart';
import '../my_investment/deposit/account_details.ui.dart';
import '../properties/properies.vm.dart';

class CartViewModel extends BaseViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<TempCart> cartItems = [];

  onInit() async {
    startLoader();
    cartItems = await walletService.fetchCarts();
    stopLoader();
    notifyListeners();
  }

  Future<void> removeFromCart(TempCart cartId) async {
    startLoader();
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection("carts").doc(cartId.id).delete();
      cartItems  = await walletService.fetchCarts();
      stopLoader();
      notifyListeners();
    } catch (e) {
      AppLogger.debug("Error removing cart item: $e");
      stopLoader();
      notifyListeners();
    }
  }


  checkOut(){
    navigationService.navigateToRoute(AccountDetailScreen(cart: cartItems[0],));
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

  increaseAmount(TempCart cart) async {
    int i = cartItems.indexWhere((test)=> test.id == cart.id);
    int index = cart.amounts.indexWhere((test)=> test == cart.amountSelected);
    if((index+1) == cart.amounts.length){
      return;
    }else{
      cart.updateAmount(cart.amounts[index+1]);
    }
    cartItems[i] = cart;
    await updateCartItem(cart);
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