import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<LoadHomeData>((event, emit) async {
      emit(HomeLoading());
      try {
        final categories = await repository.getCategories();
        final bestSellers = await repository.getBestSellers();
        final campaign = await repository.getLimitedEditionCampaign();
        
        emit(HomeLoaded(
          categories: categories,
          bestSellers: bestSellers,
          campaign: campaign,
        ));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
