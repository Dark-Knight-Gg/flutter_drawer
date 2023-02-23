import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response/domain_info_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://facexpress.vn/api/')
abstract class DomainApiService {
  factory DomainApiService(Dio dio, {String baseUrl}) = _DomainApiService;

  @GET('v1/contracts/endpoints')
  Future<DomainInfoResponse> fetchDomainInfo(@Query('key') String email);
}

@RestApi()
abstract class PrimaryApiService {
  factory PrimaryApiService(Dio dio, {String baseUrl}) = _PrimaryApiService;
}
