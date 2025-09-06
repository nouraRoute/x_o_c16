import 'package:flutter/material.dart';
import 'package:x_o/common/app_colors.dart';
import 'package:x_o/screens/initial_screen.dart';
import 'package:x_o/screens/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        InitialScreen.routeName: (context) => const InitialScreen(),
        GameScreen.routeName: (context) => const GameScreen(),
      },
      initialRoute: InitialScreen.routeName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor,
          primary: AppColors.mainColor,
        ),
        useMaterial3: true,
      ),
    );
  }
}
