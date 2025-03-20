import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:propstake/ui/base/base-vm.dart';
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

  removeFromCart(TempCart cart) async {
    await userService.removeFromCart(cart);
    notifyListeners();
  }

  checkOut(){
    navigationService.navigateToRoute(AccountDetailScreen(cart: cartItems[0],));
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
    await userService.update(cartItems);
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
    await userService.update(cartItems);
    notifyListeners();
  }




}