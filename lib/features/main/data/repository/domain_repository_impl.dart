import '../../domain/model/domain_info.dart';
import '../../domain/repository/domain_repository.dart';
import '../network/mapper/domain_info_mapper.dart';
import '../network/network_manager.dart';

class DomainRepositoryImpl implements DomainRepository {
  final NetworkManager networkManager;

  DomainRepositoryImpl(this.networkManager);

  @override
  Future<DomainInfo> fetchDomain(String email) async {
    var response = await networkManager.domainApi.fetchDomainInfo(email);
    var domainDto = response.result;
    return DomainInfoMapper.fromDTO(domainDto);
  }
}
