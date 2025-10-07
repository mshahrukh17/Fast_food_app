import 'package:fastfood_app/Export/AllExport.dart';

class Foodmodel {
  String foodimage;
  String foodname;
  String details;
  int price;
  int quantity;

  Foodmodel({
    required this.foodimage,
    required this.foodname,
    required this.details,
    required this.price,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'foodimage': foodimage,
      'foodname': foodname,
      'details': details,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Foodmodel.fromMap(Map<String, dynamic> map) {
    return Foodmodel(
      foodimage: map['foodimage'] ?? '',
      foodname: map['foodname'] ?? '',
      details: map['details'] ?? '',
      price: map['price'] ?? 0,
      quantity: map['quantity'] ?? 1,
    );
  }
}

class ResturantModel {
  String resturantimage;
  String resturantname;
  String details;

  ResturantModel(
      {required this.resturantimage,
      required this.resturantname,
      required this.details});
}

class Tables {
  String tableimage;

  Tables({
    required this.tableimage,
  });
}

class UserOrder {
  final String name;
  final String email;
  final String userID;
  final orderKey;
  final List<Map<String, dynamic>>order; 
  final String totalPrice;
  final String orderStatus;
  final DateTime timeStamp; 

  UserOrder({
    required this.name,
    required this.email,
    required this.userID,
    required this.orderKey,
    required this.order,
    required this.totalPrice,
    required this.orderStatus,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'userID': userID,
      'orderKey': orderKey,
      'order': order,
      'totalPrice': totalPrice,
      'orderStatus': orderStatus,
      'timeStamp': timeStamp, 
    };
  }

  factory UserOrder.fromMap(Map<String, dynamic> map) {
    return UserOrder(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      userID: map['userID'] ?? '',
      orderKey: map['orderKey'] ?? '',
      order: List<Map<String, dynamic>>.from(map['order'] ?? []),
      totalPrice: map['totalPrice'] ?? '',
      orderStatus: map['orderStatus'] ?? '',
      timeStamp:
          (map['timeStamp'] as Timestamp).toDate(), 
    );
  }
}
