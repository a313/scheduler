class VpnInfo {
  final String HostName;
  final String IP;
  final num Score;
  final num Ping;
  final num Speed;
  final String CountryLong;
  final String CountryShort;
  final num NumVpnSessions;
  final num Uptime;
  final num TotalUsers;
  final num TotalTraffic;
  final String LogType;
  final String Operator;
  final String Message;
  final String OpenVPN_ConfigData_Base64;

  VpnInfo(
      this.HostName,
      this.IP,
      this.Score,
      this.Ping,
      this.Speed,
      this.CountryLong,
      this.CountryShort,
      this.NumVpnSessions,
      this.Uptime,
      this.TotalUsers,
      this.TotalTraffic,
      this.LogType,
      this.Operator,
      this.Message,
      this.OpenVPN_ConfigData_Base64);
}
