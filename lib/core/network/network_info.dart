import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoRepository {
  Future<bool> get hasConnection;
}

class NetworkInfoRepositoryImpl extends NetworkInfoRepository {
  @override
  Future<bool> get hasConnection async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool result = false;

    switch (connectivityResult) {
      case ConnectivityResult.mobile:

        ///I am connected to mobile
        result = true;
        break;
      case ConnectivityResult.wifi:

        ///I am connected to wifi
        result = true;
        break;
      case ConnectivityResult.ethernet:

        ///I am connected to ethernet
        result = true;
        break;
      case ConnectivityResult.vpn:

        ///I am connected to vpn
        result = true;
        break;
      case ConnectivityResult.other:

        ///I am connected to other
        result = true;
        break;
      default:
        result = false;
    }

    return result;
  }
}
