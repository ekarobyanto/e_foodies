import 'package:connectivity_plus/connectivity_plus.dart';

checkConnection() async {
  final result = await Connectivity().checkConnectivity();
  if (result == ConnectivityResult.none) {
    throw 'No Connection';
  }
  return true;
}
