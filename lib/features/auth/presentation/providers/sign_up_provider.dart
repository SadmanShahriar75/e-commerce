import 'package:crafy_bay/app/set_up_network_caller.dart';
import 'package:crafy_bay/app/urls.dart';
import 'package:crafy_bay/core/services/network_caller.dart';
import 'package:crafy_bay/features/auth/data/models/sign_up_params.dart';
import 'package:flutter/foundation.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isSignUpInProgrss = false;

  bool get isSignUpInProgrss => _isSignUpInProgrss;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpParams params) async {
    bool isSuccess = false;
    _isSignUpInProgrss = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      url: Urls.signUpUrl,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _isSignUpInProgrss = false;
    notifyListeners();

    return isSuccess;
  }
}
