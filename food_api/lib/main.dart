import 'package:flutter/material.dart';
import 'package:food_api/pages/home/home.dart';
import 'package:food_api/pages/home/profile.dart';
import 'package:food_api/pages/login.dart';
import 'package:food_api/pages/register.dart';
import 'package:food_api/providers/auth_provider.dart';
import 'package:food_api/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Food API',
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: primaryColor,
              ),
        ),
        routes: {
          '/': (context) => Login(),
          '/register': (context) => Register(),
          '/home': (context) => Home(),
          '/profile': (context) => Profile(),
        },
      ),
    );
  }
}
