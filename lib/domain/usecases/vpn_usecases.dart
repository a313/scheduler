import 'package:aio/domain/entities/vpn_info.dart';

import '../../core/usecase/data_state.dart';
import '../repo_abs/vpn_repo_abs.dart';

class VpnUseCases {
  final VpnRepo _;

  VpnUseCases(this._);

  Future<DataState<List<VpnInfo>>> getVpnServers() async {
    return _.getVpnServers();
  }
}
