import '../model/domain_info.dart';
import '../repository/domain_repository.dart';
import 'usecase.dart';

class FetchDomainUsecase extends UseCase<String, DomainInfo> {
  final DomainRepository authRepository;

  FetchDomainUsecase(this.authRepository);

  @override
  Future<DomainInfo> execute(String params) {
    return authRepository.fetchDomain(params);
  }
}
