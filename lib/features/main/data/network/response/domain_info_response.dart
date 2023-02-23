import 'package:json_annotation/json_annotation.dart';

import '../base_response/base_response.dart';
import '../model/domain_info_dto.dart';

part 'domain_info_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DomainInfoResponse extends BaseResponse<DomainInfoDTO> {
  DomainInfoResponse(super.status,
      super.messageCode,
      super.message,
      super.result,);

  factory DomainInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$DomainInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DomainInfoResponseToJson(this);
}
