import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_realtime_test/services/custom_router.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => CustomRouter.router(settings),
      // Checks if a user is logged
      initialRoute: (FirebaseAuth.instance.currentUser == null)
          ? CustomRouter.login
          : CustomRouter.homepage,
    );
  }
}
