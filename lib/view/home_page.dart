import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:provider/provider.dart';

import '../provider/space_provider.dart';
import 'components/planet_widget.dart';
import 'like_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<SpaceProvider>(context);
    var providerFalse = Provider.of<SpaceProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Solar System'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LikedPlanetsPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: providerFalse.loadPlanets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CarouselSlider for planet images or models
                  CarouselSlider.builder(
                    itemCount: providerTrue.planets.length,
                    itemBuilder: (context, index, realIndex) {
                      return PlanetCard(planet: providerTrue.planets[index]);
                    },
                    options: CarouselOptions(
                      height: 450,
                      enlargeCenterPage: true,
                      // autoPlay: true,
                      // autoPlayInterval: const Duration(seconds: 3),
                      aspectRatio: 1.0,
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        // Optionally handle page change (e.g., update planet name)
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Json did not decoded properly'),
            );
          }
        },
      ),
    );
  }
}
