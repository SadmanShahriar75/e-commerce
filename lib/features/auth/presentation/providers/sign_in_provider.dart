import 'package:crafy_bay/app/set_up_network_caller.dart';
import 'package:crafy_bay/app/urls.dart';
import 'package:crafy_bay/core/services/network_caller.dart';
import 'package:crafy_bay/features/auth/data/models/sign_in_params.dart';
import 'package:crafy_bay/features/auth/data/models/user_model.dart';
import 'package:crafy_bay/features/auth/presentation/providers/auth_controller.dart';
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
      UserModel model = UserModel.fromJson(
        response.responseData['data']['user'],
      );
      String accessToken = response.responseData['data']['token'];
      await AuthController.saveUserData(accessToken, model);

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
