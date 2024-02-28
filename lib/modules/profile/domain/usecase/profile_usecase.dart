import '../repository/profile_repository.dart';

abstract class ProfileUseCase {}

class ProfileUseCaseImplementation implements ProfileUseCase {
  final ProfileRepository _profileRepository;
  ProfileUseCaseImplementation({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;
}
