import 'package:flutter/material.dart';
import 'package:projekutslagi/auth/login_or_register.dart';
import 'package:projekutslagi/models/restaurant.dart';
import 'package:projekutslagi/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    //theme provider
    MultiProvider(
      providers: [
        //theme
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        //resturant
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
