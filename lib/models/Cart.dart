
import 'package:ciying/models/Order.dart';

class Cart{

  List<Order> _orders;

  Cart(){
    _orders = new List();
  }

  void addOrder(Order order){
    _orders.add(order);
  }

  void removeOrder(Order order){
    _orders.remove(order);
  }

  void cleanOrder(){
    _orders.clear();
  }
  double totalPrice(){
    double total = 0;
    _orders.forEach((o){
      // total += o.orderPrice;
         total += 10;
    });

    return total;
  }

  List<Order> get orders => _orders;

  int get orderCount => _orders.length;

  bool get isEmpty => _orders.length == 0;

}