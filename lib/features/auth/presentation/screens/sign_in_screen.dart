import 'package:crafy_bay/app/app_colors.dart';
import 'package:crafy_bay/features/auth/data/models/sign_in_params.dart';
import 'package:crafy_bay/features/auth/presentation/providers/sign_in_provider.dart';
import 'package:crafy_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafy_bay/features/common/presentation/screens/main_nav_holder_screen.dart';
import 'package:crafy_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:crafy_bay/features/common/presentation/widgets/show_snackbar_msg.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInProvider _signInProvider = SignInProvider();

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ChangeNotifierProvider(
      create: (context) => _signInProvider,

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
                      'Sign In',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Login to your account with email and password',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16),

                    TextFormField(
                      controller: _emailTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: 'Email'),

                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: 'Password'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: _onTapForgetPassword,
                          child: Text("Forgot Password?"),
                        ),
                      ],
                    ),

                    Consumer<SignInProvider>(
                      builder: (context, _, _) {
                        if (_signInProvider.isSignInProgrss) {
                          return CenterCircularProgress();
                        }
                        return FilledButton(
                          onPressed: _onTapSignInButton,
                          child: Text("Sign In"),
                        );
                      },
                    ),

                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: textTheme.bodyMedium,
                        text: 'Need an account?',
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.bold,
                            ),
                            text: 'Sign Up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSingUpButton,
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

  void _onTapForgetPassword() {
    Navigator.pop(context);
  }

  void _onTapSingUpButton() {
    Navigator.pop(context);
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  Future<void> _signIn() async {
    final bool isSuccess = await _signInProvider.signIn(
      SignInParams(
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
      ),
    );
    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainNavHolderScreen.name,
        (predicate) => false,
      );
    } else {
      showSnackBarMessage(context, _signInProvider.errorMessage!);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
