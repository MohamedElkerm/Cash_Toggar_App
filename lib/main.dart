import 'package:cash_toggar_app/helper/local/cache_helper.dart';
import 'package:cash_toggar_app/helper/local/cache_helper_keys.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_start_point.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  CacheHelper.init();

  runApp(
    const CashToggar(),

    // DevicePreview(
    //     enabled: !kReleaseMode,
    //     builder: (context) => const CashToggar(),
    // ),
  );
}

/*
status        {pending , rejected , success}
 */
