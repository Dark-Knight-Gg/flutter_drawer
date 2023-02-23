import 'package:json_annotation/json_annotation.dart';

part 'domain_info_dto.g.dart';

@JsonSerializable()
class DomainInfoDTO {
  final String baseUrl;
  final String logoUrl;

  DomainInfoDTO(this.baseUrl, this.logoUrl);

  factory DomainInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$DomainInfoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DomainInfoDTOToJson(this);
}
