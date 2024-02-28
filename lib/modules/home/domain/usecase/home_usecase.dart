import '../repository/home_repository.dart';

abstract class HomeUseCase {}

class HomeUseCaseImplementation implements HomeUseCase {
  final HomeRepository _homeRepository;
  HomeUseCaseImplementation({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;
}
