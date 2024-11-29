import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

import '../detail_page.dart';

class PlanetCard extends StatelessWidget {
  final Map<String, dynamic> planet;

  const PlanetCard({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlanetDetailPage(planet: planet),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: Cube(
                onSceneCreated: (scene) {
                  scene.world.add(
                    Object(
                      fileName: 'assets/modals/${planet["model"]}',
                      scale: Vector3(5, 5, 5), // Adjust the scale
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              planet['name']!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 80,
              child: Text(
                textAlign: TextAlign.center,
                planet['description']!,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}