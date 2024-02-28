import '../repository/authentication_repository.dart';

abstract class AuthenticationUseCase {}

class AuthenticationUseCaseImplementation implements AuthenticationUseCase {
  final AuthenticationRepository _repository;

  AuthenticationUseCaseImplementation({
    required AuthenticationRepository repository,
  }) : _repository = repository;
}
