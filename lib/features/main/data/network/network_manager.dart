import 'package:dio/dio.dart';

import 'api_service.dart';

abstract class NetworkManager {
  DomainApiService get domainApi;

  PrimaryApiService get primaryApi;

  void setPrimaryApiBaseUrl(String baseUrl);
}

class NetworkManagerImpl extends NetworkManager {
  Dio domainDio;
  Dio primaryDio;
  DomainApiService? _domainApiService;
  PrimaryApiService? _primaryApiService;

  NetworkManagerImpl(this.domainDio, this.primaryDio);

  DomainApiService buildDomainApiService() {
    return DomainApiService(domainDio);
  }

  PrimaryApiService buildPrimaryApiService({String? baseUrl}) {
    return PrimaryApiService(primaryDio, baseUrl: baseUrl ?? '');
  }

  @override
  DomainApiService get domainApi {
    _domainApiService ??= buildDomainApiService();
    return _domainApiService!;
  }

  @override
  PrimaryApiService get primaryApi {
    _primaryApiService ??= buildPrimaryApiService();
    return _primaryApiService!;
  }

  @override
  void setPrimaryApiBaseUrl(String baseUrl) {
    _primaryApiService = buildPrimaryApiService(baseUrl: baseUrl);
  }
}
