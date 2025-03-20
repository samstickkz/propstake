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

  Future<bool> addCartItem({required List<String> amounts, required PropertyResponse property, required String currentPrice}) async {
    try {

      // Create cart item object with item reference
      Map<String, dynamic> cartItem = {
        "tempID": generateRandomChatId(), // Store user ID for ownership
        "userId": userService.user.email,
        "product": jsonDecode(jsonEncode(property)),
        "amountSelected": currentPrice,    // Default quantity (can be updated)
        "amounts" : amounts,    // Default quantity (can be updated)
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

      for (var dat in data) {
        try {
          properties.add(TempCart.fromJson(dat)); // Ensure this method works correctly
        } catch (e) {
          AppLogger.debug("Error parsing PropertyResponse: $e | Data: $dat");
        }
      }
      List<TempCart> personalCart = properties.where((test)=> test.userId == userService.user.email).toList();
      AppLogger.debug("Carts length ::: ${properties.length}");
      return personalCart;
    } catch (e) {
      AppLogger.debug("Error fetching properties: $e");
      return [];
    }
  }


}