import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/wishlist_repository.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository repository;

  WishlistBloc({required this.repository}) : super(WishlistInitial()) {
    on<LoadWishlistData>((event, emit) async {
      emit(WishlistLoading());
      try {
        final items = await repository.getWishlistItems();
        emit(WishlistLoaded(items: items));
      } catch (e) {
        emit(WishlistError(e.toString()));
      }
    });
  }
}
