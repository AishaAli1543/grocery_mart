import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.values
        .fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  void addItem(String productId, String name, double price, {bool increment = true}) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
            (existing) => CartItem(
          id: existing.id,
          name: existing.name,
          quantity: increment
              ? existing.quantity + 1
              : existing.quantity - 1,
          price: existing.price,
        ),
      );

      if (_items[productId]!.quantity <= 0) {
        _items.remove(productId);
      }
    } else {
      _items[productId] = CartItem(
        id: productId,
        name: name,
        quantity: 1,
        price: price,
      );
    }

    saveCart();
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    saveCart();
    notifyListeners();
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartList = _items.map((key, value) => MapEntry(key, value.toJson()));
    prefs.setString('cart', jsonEncode(cartList));
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('cart');
    if (data != null) {
      final Map<String, dynamic> decoded = jsonDecode(data);
      _items = decoded.map((key, value) =>
          MapEntry(key, CartItem.fromJson(value)));
      notifyListeners();
    }
  }

  void clearCart() {
    _items = {};
    saveCart();
    notifyListeners();
  }
}
