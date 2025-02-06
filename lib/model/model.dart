class Foodmodel{
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
    this.quantity = 1
  });
}

class ResturantModel{
  String resturantimage;
  String resturantname;
  String details;

  ResturantModel({
   required this.resturantimage,
   required this.resturantname,
   required this.details
  });
}

class Tables{
  String tableimage;

  Tables({
   required this.tableimage,
  });
}