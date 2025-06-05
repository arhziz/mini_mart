// ignore_for_file: public_member_api_docs

part of 'cart_bloc.dart';

class CartState {
  CartState({required this.items});
  final List<CartItem> items;

  double get totalPrice => items.fold(0, (sum, item) => sum + item.totalPrice);

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }
}
