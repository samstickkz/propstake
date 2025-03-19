import 'package:flutter/material.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/widget/price_widget.dart';

import '../cart/cart_ui.dart';
import 'bookmarks/bookmark.ui.dart';
import 'product_detail/product_detail.ui.dart';

class PropertiesViewModel extends BaseViewModel {

  int initialIndex = 0;
  ScrollController scrollController = ScrollController();

  onChangeIndex(int val){
    initialIndex = val;
    notifyListeners();
  }
  
  List<TempProperties> properties = [
    TempProperties(
      id: "abcd1232",
      name: "Plaza Dubai",
      coverImage: "https://images.pexels.com/photos/325193/pexels-photo-325193.jpeg",
      location: "Kings Island, Dubai, UAE",
      images: [
        "https://images.pexels.com/photos/325193/pexels-photo-325193.jpeg",
        "https://images.pexels.com/photos/162031/dubai-tower-arab-khalifa-162031.jpeg",
        "https://images.pexels.com/photos/2044434/pexels-photo-2044434.jpeg",
        "https://images.pexels.com/photos/1534411/pexels-photo-1534411.jpeg",
        "https://images.pexels.com/photos/618079/pexels-photo-618079.jpeg",
      ],
      country: "UAE",
      propertyType: PropertyType.rented,
      totalCost: 100000,
      amountFunded: 70000,
      returnPercentagePerYear: 5,
      returnPercentageFiveYears: 17,
      currency: Currency.dollar,
    ),
    TempProperties(
      id: "abcd1233",
      name: "Palm Harbor",
      coverImage: "https://images.pexels.com/photos/16715771/pexels-photo-16715771/free-photo-of-residential-buildings-by-sea.jpeg",
      location: "2699 Green Valley, Highland Lake, FL",
      images: [
        "https://images.pexels.com/photos/10915197/pexels-photo-10915197.png",
        "https://images.pexels.com/photos/16715771/pexels-photo-16715771/free-photo-of-residential-buildings-by-sea.jpeg",
        "https://images.pexels.com/photos/17526369/pexels-photo-17526369/free-photo-of-central-bank-of-kuwait-skyscraper-over-sea-coast.jpeg",
        "https://images.pexels.com/photos/5864399/pexels-photo-5864399.jpeg",
      ],
      country: "USA",
      propertyType: PropertyType.sale,
      totalCost: 20000,
      amountFunded: 2100,
      returnPercentagePerYear: 10,
      returnPercentageFiveYears: 50,
      currency: Currency.dollar,
    ),
    TempProperties(
      id: "abcd1234",
      name: "Victoria Island",
      coverImage: "https://www.shutterstock.com/image-photo/victoria-island-lagos-june-23-260nw-1828143758.jpg",
      location: "Adeola Deku Street, Victoria Island, LG",
      images: [
        "https://www.shutterstock.com/image-photo/view-lagos-lagoon-victoria-island-260nw-1066980758.jpg",
        "https://www.shutterstock.com/image-photo/victoria-island-lagos-june-23-260nw-1828143758.jpg",
        "https://www.shutterstock.com/image-photo/lagos-nigeria-may-12-2019-260nw-1411433660.jpg",
      ],
      country: "NIGERIA",
      propertyType: PropertyType.sale,
      totalCost: 200000000,
      amountFunded: 90000000,
      returnPercentagePerYear: 6,
      returnPercentageFiveYears: 30,
      currency: Currency.naira,
    ),



  ];

  goToPropertyDetail(int index){
    navigationService.navigateToRoute(ProductDetailScreen(property: properties[index],));
  }

  goToBookMark(){
    navigationService.navigateToRoute(BookMarkScreen()).whenComplete(()=> notifyListeners());
  }

  goToCart(){
    navigationService.navigateToRoute(CartScreen()).whenComplete(()=> notifyListeners());
  }

  saveUnsavedProperties(TempProperties property) async {
    await userService.saveUnSaveBookMark(property);
    notifyListeners();
  }

}

class TempProperties {
  String id;
  String name;
  String coverImage;
  String location;
  List<String> images;
  String country;
  PropertyType propertyType;
  num totalCost;
  num amountFunded;
  num returnPercentagePerYear;
  num returnPercentageFiveYears;
  Currency currency;

  TempProperties({
    required this.id,
    required this.name,
    required this.coverImage,
    required this.location,
    required this.images,
    required this.country,
    required this.propertyType,
    required this.totalCost,
    required this.amountFunded,
    required this.returnPercentagePerYear,
    required this.returnPercentageFiveYears,
    required this.currency,
  });
}

enum PropertyType {
  rented, sale
}

class TempCart {
  String id;
  String amountSelected;
  TempProperties product;
  List<String> amounts;

  TempCart({
    required this.id,
    required this.amountSelected,
    required this.product,
    required this.amounts,
  });

  updateAmount(String amount){
    amountSelected = amount;
  }
}