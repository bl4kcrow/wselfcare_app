import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/profile_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;

  ProfileBloc({required this.repository}) : super(ProfileInitial()) {
    on<LoadProfileData>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await repository.getUserProfile();
        emit(ProfileLoaded(userProfile: profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}
