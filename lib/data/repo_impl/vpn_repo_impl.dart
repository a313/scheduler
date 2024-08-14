import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/vpn_info_model.dart';

import '../../domain/entities/vpn_info.dart';
import '../../domain/repo_abs/vpn_repo_abs.dart';
import '../services/vpn_service.dart';

class VpnRepoImpl extends VpnRepo {
  final VpnService _;

  VpnRepoImpl(this._);

  @override
  Future<DataState<List<VpnInfo>>> getVpnServers() async {
    final Response response = await _.getVpnServers();

    if (response.statusCode == 200) {
      final compare = response.bodyString!.split('#')[1].replaceAll("*", "");
      List<List<dynamic>> data = const CsvToListConverter().convert(compare);
      final header = data[0];
      List<VpnInfo> result = [];
      for (var i = 1; i < data.length - 1; i++) {
        Map<String, dynamic> jsonData = {};
        for (int j = 0; j < header.length; j++) {
          jsonData.addAll({header[j].toString(): data[i][j]});
        }
        result.add(VpnInfoModel.fromJson(jsonData));
      }

      return DataSuccess(result);
    } else {
      return DataFailure(response.statusText ?? '', response.body.toString());
    }
  }
}
