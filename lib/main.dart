  import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import 'package:save_water/authentication/auth_gate.dart';
import 'package:save_water/home/home_page.dart';
import 'package:save_water/home/start_page.dart';
import 'package:save_water/events/event_menu.dart';
import 'package:save_water/events/international_events.dart';
import 'package:save_water/events/local_events.dart';
import 'package:save_water/gallery/galleryV2.dart';
import 'package:save_water/tracker/watertracker_menu.dart';
//import 'package:save_water/tracker/manual_tracker_v2.dart';
import 'package:save_water/tracker/manual_tracker_rework.dart';
import 'package:save_water/scannable_tracker/scannable_tracker.dart';

import 'package:save_water/theme/theme.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();

  FlutterNativeSplash.remove();

  return runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Start(),
        '/auth': (context) => const AuthGate(),
        //'/home/water/manual': (context) => const manualTracker(),
        // '/home': (context) => const HomePage(user: user),
        '/home/water/manual' : (context) => const manualRework(),
        '/home/water/scan' : (context) => const ScannableTracker(),
        '/home/water': (context) => const waterMenu(),
        '/home/event': (context) => const eventMenu(),
        '/home/event/international': (context) => const interEvents(),
        '/home/event/local': (context) => const localEvents(),
        '/home/gallery': (context) => const Gallery(),
      },
      color: primaryColor,
    ),
  );
}
