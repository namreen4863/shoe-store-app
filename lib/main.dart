// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:villa/splash/splash_screen.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var splashScreen = SplashScreen;

    return MaterialApp(
      title: 'Shoe Palace',
      theme: ThemeData(
        primaryColor: Color(0xFF7639c3),
        primarySwatch: Colors.purple,
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFffffff),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

// command 
// --no-sound-null-safety
