import 'dart:async';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/space bg.jpg'),
          ),
        ),
        child: const Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Text(
              'OUTER',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 55,
                letterSpacing: 2.5,
              ),
            ),
            Text(
              'SPACE',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 55,
                  letterSpacing: 2),
            ),
            Spacer(),
            Text(
              'EXPLORE SOLAR SYSTEM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
