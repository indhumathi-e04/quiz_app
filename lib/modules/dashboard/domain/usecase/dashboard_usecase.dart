import '../repository/dashboard_repository.dart';

abstract class DashboardUseCase {}

class DashboardUseCaseImplementation implements DashboardUseCase {
  final DashboardRepository _dashboardRepository;

  DashboardUseCaseImplementation({
    required DashboardRepository dashboardRepository,
  }) : _dashboardRepository = dashboardRepository;
}
