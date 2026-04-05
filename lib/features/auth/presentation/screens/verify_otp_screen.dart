import 'package:crafy_bay/app/app_colors.dart';
import 'package:crafy_bay/features/auth/data/models/verify_otp_params.dart';
import 'package:crafy_bay/features/auth/presentation/providers/verify_otp_provider.dart';
import 'package:crafy_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafy_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafy_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:crafy_bay/features/common/presentation/widgets/show_snackbar_msg.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  PinInputController _otpTEController = PinInputController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ChangeNotifierProvider(
      create: (_) => _verifyOtpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 8,
                  children: [
                    Center(child: AppLogo(width: 90)),
                    const SizedBox(height: 8),
                    Text(
                      'Verify Otp',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'A 4 digits Otp has been sent to your email address',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16),

                    MaterialPinField(
                      length: 6,
                      onCompleted: (pin) => print('PIN: $pin'),
                      onChanged: (value) => print('Changed: $value'),
                      theme: MaterialPinTheme(
                        shape: MaterialPinShape.outlined,
                        cellSize: Size(40, 50),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      pinController: _otpTEController,
                    ),

                    Consumer<VerifyOtpProvider>(
                      builder: (context, _, _) {
                        if (_verifyOtpProvider.isVerifyOtpInProgress) {
                          return CenterCircularProgress();
                        }
                        return FilledButton(
                          onPressed: _onTapVerifyButton,
                          child: Text("Verify Otp"),
                        );
                      },
                    ),

                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: textTheme.bodyMedium,
                        text: 'Already an account?',
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.bold,
                            ),
                            text: 'Sign In',
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSingInButton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSingInButton() {
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  void _onTapVerifyButton() {
    if (_formKey.currentState!.validate()) {
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async {
    VerifyOtpParams params = VerifyOtpParams(
      email: widget.email,
      otp: _otpTEController.text,
    );
    final bool isSuccess = await _verifyOtpProvider.verifyOtp(params);
    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SignInScreen.name,
        (predicate) => false,
      );
    } else {
      showSnackBarMessage(context, _verifyOtpProvider.errorMessage!);
    }
  }
}
