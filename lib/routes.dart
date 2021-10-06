//import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:villa/Calculator/Calc.dart';

import 'package:villa/forgot_password.dart';
import 'package:villa/homepage.dart';
import 'package:villa/location.dart';
import 'package:villa/login_screen.dart';
import 'package:villa/register_screen.dart';
import 'package:villa/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  Homepage.routeName: (context) => Homepage(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  LocationApp.routeName: (context) => LocationApp(),
  Calc.routeName: (context) => Calc(), 
};
