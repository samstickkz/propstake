import 'dart:convert';
import 'dart:math' show Random;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:propstake/data/model/propert_response.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/properties/product_detail/product_detail.ui.dart';
import 'package:propstake/ui/home/properties/properies.vm.dart';

import '../../../../utils/app_logger.dart';
import '../../../../utils/constants.dart';
import '../../../../widget/price_widget.dart';
import '../../cart/cart_ui.dart';
import '../../my_investment/faq_details/faq_detail_page.dart';
import '../../profile/profile_home.vm.dart';

class ProductDetailViewModel extends BaseViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  PropertyResponse? property;

  init(PropertyResponse properti){
    property = properti;
    notifyListeners();
  }

  saveUnsavedProperties(PropertyResponse property) async {
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
    await addCartItem(amounts).whenComplete(fetchCarts);
    notifyListeners();

    navigationService.navigateToRoute(CartScreen());
  }

  // Fetch list of users
  Future<List<PropertyResponse>> fetchCarts() async {
    try {
      List<PropertyResponse> properties = [];

      QuerySnapshot querySnapshot = await firestore.collection("carts").get();

      List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) {
        // Create a new map to avoid modifying Firestore's immutable data
        Map<String, dynamic> docData = Map<String, dynamic>.from(doc.data() as Map<String, dynamic>);
        docData['id'] = doc.id;  // Add document ID to the map
        return docData;
      }).toList();

      AppLogger.debug("Cart ::: ${data.length}");

      for (var dat in data) {
        AppLogger.debug("Cart per ::: ${dat}");

        try {
          // properties.add(PropertyResponse.fromJson(dat)); // Ensure this method works correctly
        } catch (e) {
          // AppLogger.debug("Error parsing PropertyResponse: $e | Data: $dat");
        }
      }

      AppLogger.debug("Property length ::: ${properties.length}");
      return properties;
    } catch (e) {
      print("Error fetching properties: $e");
      return [];
    }
  }

  Future<void> addCartItem(List<String> amounts) async {
    try {

      // Create cart item object with item reference
      Map<String, dynamic> cartItem = {
        "tempID": generateRandomChatId(), // Store user ID for ownership
        "product": jsonDecode(jsonEncode(property)),
        "amountSelected": currentPrice??"",    // Default quantity (can be updated)
        "amounts" : amounts,    // Default quantity (can be updated)
        "addedAt": DateTime.now().toString() // Timestamp for tracking
      };

      // Add to "carts" collection
      await firestore.collection("carts").add(cartItem);

      notifyListeners();

      print("Cart item added successfully!");
    } catch (e) {
      print("Error adding cart item: $e");
    }
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