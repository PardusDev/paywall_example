import 'package:flutter/material.dart';
import 'package:paywall_example/screens/paywall_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paywall Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.black
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const PaywallScreen(),
    );
  }
}

