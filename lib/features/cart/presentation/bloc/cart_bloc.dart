// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:mini_mart/features/cart/domain/domain.dart';
import 'package:mini_mart/shared/shared.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: [])) {
    on<AddToCart>((event, emit) {
      final existingIndex = state.items.indexWhere(
        (ci) => ci.item.id == event.item.id,
      );

      if (existingIndex != -1) {
        final updatedItems = List<CartItem>.from(state.items);
        final current = updatedItems[existingIndex];
        updatedItems[existingIndex] =
            current.copyWith(quantity: current.quantity + 1);
        emit(state.copyWith(items: updatedItems));
      } else {
        emit(
          state.copyWith(
            items: [...state.items, CartItem(item: event.item, quantity: 1)],
          ),
        );
      }
    });

    on<UpdateCartItemQuantity>((event, emit) {
      final updatedItems = state.items.map((cartItem) {
        if (cartItem.item.id == event.itemId) {
          return cartItem.copyWith(quantity: event.quantity);
        }
        return cartItem;
      }).toList();
      emit(state.copyWith(items: updatedItems));
    });

    on<RemoveFromCart>((event, emit) {
      final updatedItems =
          state.items.where((ci) => ci.item.id != event.itemId).toList();
      emit(state.copyWith(items: updatedItems));
    });

    on<ClearCart>((event, emit) {
      emit(CartState(items: []));
    });
  }
}
