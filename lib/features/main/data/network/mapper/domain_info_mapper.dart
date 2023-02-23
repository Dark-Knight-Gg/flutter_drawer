import 'package:smartstruct/smartstruct.dart';

import '../../../domain/model/domain_info.dart';
import '../model/domain_info_dto.dart';

part 'domain_info_mapper.mapper.g.dart';

@Mapper()
abstract class DomainInfoMapper {
  static DomainInfo fromDTO(DomainInfoDTO dto) => _$fromDTO(dto);
}
