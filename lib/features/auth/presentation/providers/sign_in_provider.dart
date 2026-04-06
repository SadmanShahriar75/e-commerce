import 'package:crafy_bay/app/set_up_network_caller.dart';
import 'package:crafy_bay/app/urls.dart';
import 'package:crafy_bay/core/services/network_caller.dart';
import 'package:crafy_bay/features/auth/data/models/sign_in_params.dart';
import 'package:flutter/foundation.dart';

class SignInProvider extends ChangeNotifier {
  bool _isSignInProgrss = false;

  bool get isSignInProgrss => _isSignInProgrss;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInParams params) async {
    bool isSuccess = false;
    _isSignInProgrss = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      url: Urls.signInUrl,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _isSignInProgrss = false;
    notifyListeners();

    return isSuccess;
  }
}
