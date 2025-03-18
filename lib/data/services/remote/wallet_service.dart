import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../model/default.model.dart';
import '../../model/transaction_response.dart';
import '../../model/wallet_response_model.dart';
import 'base.api.service.dart';

class WalletService {

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


}