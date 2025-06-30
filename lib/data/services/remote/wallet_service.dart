import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propstake/utils/constants.dart';

import '../../../utils/app_logger.dart';
import '../../model/cart_model.dart';
import '../../model/default.model.dart';
import '../../model/propert_response.dart';
import '../../model/transaction_response.dart';
import '../../model/wallet_response_model.dart';
import 'base.api.service.dart';

class WalletService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Either<ResModel, BalanceResponse>> getWallet() async {
    try {
      Response response = await connect().get("Wallet/wallet-balance");
      BalanceResponse signUpResponse = BalanceResponse.fromJson(jsonDecode(response.data));
      ResModel defaultRes = ResModel.fromJson(jsonDecode(response.data));
      if(defaultRes.successful == true){
        return Right(signUpResponse);
      }
      return Left(defaultRes);
    } on DioException catch (e) {
      return Left(ResModel.fromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }


  Future<Either<ResModel, TransactionResponse>> getTransactions() async {
    try {
      Response response = await connect().get("User/user-transactions");
      ResModel defaultRes = ResModel.fromJson(jsonDecode(response.data));
      TransactionResponse signUpResponse = TransactionResponse.fromJson(jsonDecode(response.data));
      if(defaultRes.successful == true){
        return Right(signUpResponse);
      }
      return Left(defaultRes);
    } on DioException catch (e) {
      return Left(ResModel.fromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  String generateRandomChatId() {
    const allowedChars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    const allowedSymbols = '!@#\$%^&*()-_=+[]{};:<>,.?/';

    final firstPart = String.fromCharCodes(List.generate(5, (_) => allowedChars.codeUnitAt(Random().nextInt(allowedChars.length))));
    final middlePart = String.fromCharCodes(List.generate(23, (_) => Random().nextBool() ? allowedChars.codeUnitAt(Random().nextInt(allowedChars.length)) : allowedSymbols.codeUnitAt(Random().nextInt(allowedSymbols.length))));
    final lastPart = String.fromCharCodes(List.generate(2, (_) => allowedChars.codeUnitAt(Random().nextInt(allowedChars.length))));

    return firstPart + middlePart + lastPart;
  }

  Future<bool> addCartItem({required PropertyResponse property, required String currentPrice}) async {
    try {

      // Create cart item object with item reference
      Map<String, dynamic> cartItem = {
        "tempID": generateRandomChatId(), // Store user ID for ownership
        "userId": userService.user.email,
        "product": jsonDecode(jsonEncode(property)),
        "amountSelected": currentPrice,
        "addedAt": DateTime.now().toString() // Timestamp for tracking
      };

      // Add to "carts" collection
      await firestore.collection("carts").add(cartItem);

      return true;
    } catch (e) {
      AppLogger.debug("Error adding cart item: $e");
      return false;
    }
  }

  Future<bool> transaction({
    required PropertyResponse property,
    required num currentPrice,
    required String id,
    required String wallet,
    required String paymentType,
  }) async {
    try {

      final docRef = FirebaseFirestore.instance
          .collection("new")
          .doc(property.id??"");

      Map<String, dynamic> cartItem = {
        "tempID": id,
        "userId": userService.user.email,
        "paymentType": paymentType,
        "wallet": wallet,
        "product": docRef,
        "status": "pending",
        "amountSelected": currentPrice,
        "addedAt": DateTime.now().toString()
      };

      Map<String, dynamic> values = {
        "tempID": id,
        "userId": userService.user.email,
        "amountSelected": currentPrice,
        "paymentType": paymentType,
        "status": "pending",
        "wallet": wallet,
        "addedAt": DateTime.now().toString()
      };


      // Add to "carts" collection
      await firestore.collection("transactions").add(cartItem);

      await FirebaseFirestore.instance.collection("new").doc(property.id).update({
        "sale": FieldValue.arrayUnion([values]),
        "amountFunded": (property.amountFunded??0) + currentPrice
      });

      return true;
    } catch (e) {
      AppLogger.debug("Error adding cart item: $e");
      return false;
    }
  }


  Future<bool> updateCartItem({required TempCart cart}) async {
    try {

      Map<String, dynamic> cartJson = jsonDecode(jsonEncode(cart));
      cartJson.remove("id");

      // Add to "carts" collection
      await firestore.collection("carts").doc(cart.id).update(cartJson);

      return true;
    } catch (e) {
      AppLogger.debug("Error adding cart item: $e");
      return false;
    }
  }

  // Fetch list of users
  Future<List<TempCart>> fetchCarts() async {
    try {
      List<TempCart> properties = [];

      QuerySnapshot querySnapshot = await firestore.collection("carts").get(GetOptions(source: Source.server));

      List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) {
        // Create a new map to avoid modifying Firestore's immutable data
        Map<String, dynamic> docData = Map<String, dynamic>.from(doc.data() as Map<String, dynamic>);
        docData['id'] = doc.id;  // Add document ID to the map
        return docData;
      }).toList();

      for (var dat in data) {
        try {
          properties.add(TempCart.fromJson(dat)); // Ensure this method works correctly
        } catch (e) {
          AppLogger.debug("Error parsing PropertyResponse: $e | Data: $dat");
        }
      }
      List<TempCart> personalCart = properties.where((test)=> test.userId == userService.user.email).toList();
      userService.updateCarts(personalCart);
      AppLogger.debug("Carts length ::: ${properties.length}");
      return personalCart;
    } catch (e) {
      AppLogger.debug("Error fetching properties: $e");
      return [];
    }
  }

  // Fetch list of users
  Future<List<TempTransactions>> fetchTransactions() async {
    try {
      List<TempTransactions> properties = [];

      QuerySnapshot querySnapshot = await firestore.collection("transactions").get(GetOptions(source: Source.server));

      List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) {
        Map<String, dynamic> docData = Map<String, dynamic>.from(doc.data() as Map<String, dynamic>);
        docData['id'] = doc.id;  // Add document ID to the map
        return docData;
      }).toList();

      print(data);

      for (var dat in data) {
        try {
          properties.add(TempTransactions.fromJson(dat)); // Ensure this method works correctly
        } catch (e) {
          AppLogger.debug("Error parsing transaction: $e | Data: $dat");
        }
      }
      List<TempTransactions> personalCart = properties.where((test)=> test.userId == userService.user.email).toList();
      userService.updateTransactions(personalCart);
      AppLogger.debug("Carts length ::: ${properties.length}");
      return personalCart;
    } catch (e) {
      AppLogger.debug("Error fetching properties: $e");
      return [];
    }
  }

  // Fetch list of users
  Future<List<PropertyResponse>> fetchProperties() async {
    try {
      List<PropertyResponse> propertiez = [];

      QuerySnapshot querySnapshot = await firestore.collection("new").get(GetOptions(source: Source.server));

      List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) {
        // Create a new map to avoid modifying Firestore's immutable data
        Map<String, dynamic> docData = Map<String, dynamic>.from(doc.data() as Map<String, dynamic>);
        docData['id'] = doc.id;  // Add document ID to the map
        return docData;
      }).toList();

      AppLogger.debug("Property ::: ${data.length}");

      for (var dat in data) {
        AppLogger.debug("Property per ::: $dat");

        try {
          propertiez.add(PropertyResponse.fromJson(dat)); // Ensure this method works correctly
        } catch (e) {
          AppLogger.debug("Error parsing PropertyResponse: $e | Data: $dat");
        }
      }

      AppLogger.debug("Property length ::: ${propertiez.length}");
      return propertiez;
    } catch (e) {
      print("Error fetching properties: $e");
      return [];
    }
  }


}