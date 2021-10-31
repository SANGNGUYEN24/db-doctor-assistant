import 'package:app/screens/forgot_password/forgot_password_screen.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/login_success/login_success_screen.dart';
import 'package:app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/widgets.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
final Map<String, WidgetBuilder> routes = {
// All our routes will be available here
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
