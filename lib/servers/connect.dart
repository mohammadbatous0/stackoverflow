import 'package:connectivity_plus/connectivity_plus.dart';

class Connect {
  Future<bool> checkFoundInternet() async {
    bool isconected = false;
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      isconected = true;
    }

    return isconected;
  }
}
