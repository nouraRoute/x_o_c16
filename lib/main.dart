import 'package:flutter/material.dart';
import 'package:x_o/common/app_colors.dart';
import 'package:x_o/screens/initial_screen.dart';
import 'package:x_o/screens/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        InitialScreen.routeName: (context) => const InitialScreen(),
        GameScreen.routeName: (context) => const GameScreen(),
      },
      initialRoute: InitialScreen.routeName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor,
          primary: AppColors.mainColor,
          secondary: AppColors.secColor,
        ),
        useMaterial3: true,
      ),
    );
  }
}
