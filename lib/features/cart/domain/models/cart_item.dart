// ignore_for_file: public_member_api_docs

import 'package:mini_mart/shared/shared.dart';

class CartItem {
  CartItem({
    required this.item,
    required this.quantity,
  });
  final Item item;
  final int quantity;

  double get totalPrice => item.price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      item: item,
      quantity: quantity ?? this.quantity,
    );
  }
}
