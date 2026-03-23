import 'package:crafy_bay/app/app_colors.dart';
import 'package:crafy_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
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

                FilledButton(
                  onPressed: _onTapSignInButton,
                  child: Text("Sign In"),
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
    );
  }

  void _onTapSingUpButton() {
    Navigator.pop(context);
  }

  void _onTapSignInButton() {}
}
