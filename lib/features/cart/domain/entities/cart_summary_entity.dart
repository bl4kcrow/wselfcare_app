class CartSummaryEntity {
  final double subtotal;
  final double shipping;
  final double total;
  final bool isShippingCalculated;

  const CartSummaryEntity({
    required this.subtotal,
    required this.shipping,
    required this.total,
    required this.isShippingCalculated,
  });
}
