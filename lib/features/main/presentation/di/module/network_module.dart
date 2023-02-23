import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../data/network/network_manager.dart';

abstract class NetworkModule {
  static Dio _provideDioDomain() {
    return Dio()
      ..interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
  }

  static Dio _provideDioPrimary() {
    return Dio()
      ..interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
  }

  static RepositoryProvider<NetworkManager> _provideNetworkManager() {
    return RepositoryProvider<NetworkManager>(create: (context) {
      final domainDio = _provideDioDomain();
      final primaryDio = _provideDioPrimary();
      return NetworkManagerImpl(domainDio, primaryDio);
    });
  }

  static List<RepositoryProvider> dependencies() {
    return [
      _provideNetworkManager(),
    ];
  }
}
