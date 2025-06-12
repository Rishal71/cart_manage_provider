import 'package:cart_manage_provider/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier{
  final List<Product> _items =[];

  List<Product> get items => _items;

  void add(Product item){
    _items.add(item);
    notifyListeners();
  }

  void remove(Product item){
    _items.remove(item);
    notifyListeners();
  }

  void removeAll(){
    _items.clear();
    notifyListeners(); 
  }
  double getCartTotal(){
    return _items.fold(0, (previousvalue,item)=>previousvalue+item.price);
  }
}