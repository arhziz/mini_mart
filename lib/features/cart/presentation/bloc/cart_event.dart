// ignore_for_file: public_member_api_docs

part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  AddToCart(this.item);
  final Item item;
}

class UpdateCartItemQuantity extends CartEvent {
  UpdateCartItemQuantity(this.itemId, this.quantity);
  final int itemId;
  final int quantity;
}

class RemoveFromCart extends CartEvent {
  RemoveFromCart(this.itemId);
  final int itemId;
}

class ClearCart extends CartEvent {}
