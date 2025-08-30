import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:propstake/data/model/propert_response.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/app_logger.dart';
import 'package:propstake/utils/constants.dart';

import '../cart/cart_ui.dart';
import 'bookmarks/bookmark.ui.dart';
import 'product_detail/product_detail.ui.dart';

class PropertiesViewModel extends BaseViewModel {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;



  List<PropertyResponse> properties = [];

  void listenToFirestore() {
    FirebaseFirestore.instance
        .collection("new") // Listening to the entire "new" collection
        .snapshots()
        .listen((snapshot) {

      List<Map<String, dynamic>> data = snapshot.docs.map((doc) {
        // Create a new map to avoid modifying Firestore's immutable data
        Map<String, dynamic> docData = Map<String, dynamic>.from(doc.data());
        docData['id'] = doc.id;  // Add document ID to the map
        return docData;
      }).toList();

      // print("Property Lengthsss ::: ${data.length}");

      for (var dat in data) {

        try {
          PropertyResponse propertyData = PropertyResponse.fromJson(dat);
          if(properties.any((test)=> test.id == propertyData.id)){
            properties[properties.indexWhere((test)=> test.id == propertyData.id)] = propertyData;
          }else{
            properties.add(propertyData);
          }
          notifyListeners();
        } catch (e) {
          AppLogger.debug("Error parsing PropertyResponse: $e | Data: ${jsonEncode(dat)}");
        }
      }

    });
    notifyListeners();
  }


  init()async{
    startLoader();
    // properties = await walletService.fetchProperties();
    listenToFirestore();
    stopLoader();
    notifyListeners();
  }

  int initialIndex = 0;
  ScrollController scrollController = ScrollController();

  onChangeIndex(int val){
    initialIndex = val;
    notifyListeners();
  }


  goToPropertyDetail(PropertyResponse property){
    try{
      navigationService.navigateToRoute(ProductDetailScreen(property: property));
    }catch(err){
      AppLogger.debug(err.toString());
    }
  }

  goToBookMark(){
    navigationService.navigateToRoute(BookMarkScreen()).whenComplete(()=> notifyListeners());
  }

  goToCart(){
    navigationService.navigateToRoute(CartScreen()).whenComplete(()=> notifyListeners());
  }

  saveUnsavedProperties(PropertyResponse property) async {
    await userService.saveUnSaveBookMark(property);
    notifyListeners();
  }

}