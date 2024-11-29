import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app/provider/space_provider.dart';
import 'package:space_app/view/home_page.dart';
import 'package:space_app/view/splash_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SpaceProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
