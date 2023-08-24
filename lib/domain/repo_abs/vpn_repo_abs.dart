import '../../core/usecase/data_state.dart';
import '../entities/vpn_info.dart';

abstract class VpnRepo {
  Future<DataState<List<VpnInfo>>> getVpnServers();
}
