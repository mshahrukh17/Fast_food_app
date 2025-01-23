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