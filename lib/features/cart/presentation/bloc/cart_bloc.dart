import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc({required this.repository}) : super(CartInitial()) {
    on<LoadCartData>((event, emit) async {
      emit(CartLoading());
      try {
        final items = await repository.getCartItems();
        final summary = await repository.getCartSummary();
        
        emit(CartLoaded(
          items: items,
          summary: summary,
        ));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });
  }
}
