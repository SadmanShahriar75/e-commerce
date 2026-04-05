import 'package:crafy_bay/core/services/network_caller.dart';

NetworkCaller getNetworkCaller() {
  NetworkCaller networkCaller = NetworkCaller(
    headers: {'Content-type': 'application/json', 'token': 'token'},
    unAuthorized: () {
      // move to login screen
    },
  );
  return networkCaller;
}
