import '../model/domain_info.dart';

abstract class DomainRepository {
  Future<DomainInfo> fetchDomain(String email);
}
