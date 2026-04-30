import '../../domain/entities/user_profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';

class MockProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<UserProfileEntity> getUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const UserProfileEntity(
      id: '1',
      name: 'Elena Montgomery',
      email: 'elena.m@curator.com',
      profileImageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCrsYXE827pKvMT3tIfub7wnwJFJdUVBU01hHq8uQcDcjVqs7Bo6ZR7ZjkzfM64SRBojwujLwMY4-H541gKDp6p7famq5dEqRykoUqwirK0jwvvN7DFbtX-AMaCe9SrCmUXXFy6m8pALKxJ88xiKCFRBQV1kGTB1bFa_kympGSWFanrf-QbY5mUNvypSODxk32HGhnxzKYSVqEYsgG2dSaVQreVJA_gU0RkuM08ZlsjygLBZoLHRM38xpUU49M7WTAmnZyiQcspuUQ',
      ordersCount: 12,
      favoritesCount: 24,
      reviewsCount: 5,
    );
  }
}
