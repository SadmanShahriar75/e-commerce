// Initail Set up
// 1. Folder structure
// 2. Firebase set up
// 3. Firebase crashlytics
// 4. Ffirebase analytics
// 5. Localization
// 6. Theme
// 7. Routing
// 8. Network Caller

import 'dart:ui';

import 'package:crafy_bay/app/app.dart';
import 'package:crafy_bay/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(CraftyBayApp());
}
