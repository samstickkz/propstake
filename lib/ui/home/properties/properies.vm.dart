import 'package:flutter/material.dart';
import 'package:propstake/ui/base/base-vm.dart';

class PropertiesViewModel extends BaseViewModel {

  int initialIndex = 0;
  ScrollController scrollController = ScrollController();

  onChangeIndex(int val){
    initialIndex = val;
    notifyListeners();
  }



}