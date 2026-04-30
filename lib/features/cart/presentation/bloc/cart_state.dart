import 'package:equatable/equatable.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/cart_summary_entity.dart';

abstract class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemEntity> items;
  final CartSummaryEntity summary;

  const CartLoaded({
    required this.items,
    required this.summary,
  });

  @override
  List<Object?> get props => [items, summary];
}

class CartError extends CartState {
  final String message;
  
  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}
