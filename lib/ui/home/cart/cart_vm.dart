import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/constants.dart';

import '../../../data/model/cart_model.dart';
import '../../../data/model/propert_response.dart';
import '../../../utils/app_logger.dart';
import '../my_investment/deposit/account_details.ui.dart';
import '../properties/properies.vm.dart';

class CartViewModel extends BaseViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<TempCart> cartItems = [];

  // Fetch list of users
  Future<List<TempCart>> fetchCarts() async {
    try {
      List<TempCart> properties = [];

      QuerySnapshot querySnapshot = await firestore.collection("carts").get();

      List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) {
        // Create a new map to avoid modifying Firestore's immutable data
        Map<String, dynamic> docData = Map<String, dynamic>.from(doc.data() as Map<String, dynamic>);
        docData['id'] = doc.id;  // Add document ID to the map
        return docData;
      }).toList();

      AppLogger.debug("Cart ::: ${data.length}");

      for (var dat in data) {
        AppLogger.debug("Cart per ::: ${jsonEncode(dat)}");

        try {
          properties.add(TempCart.fromJson(dat)); // Ensure this method works correctly
        } catch (e) {
          AppLogger.debug("Error parsing PropertyResponse: $e | Data: $dat");
        }
      }

      AppLogger.debug("Property length ::: ${properties.length}");
      return properties;
    } catch (e) {
      print("Error fetching properties: $e");
      return [];
    }
  }

  onInit() async {
    startLoader();
    cartItems = await fetchCarts();
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