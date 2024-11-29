import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:provider/provider.dart';

import '../provider/space_provider.dart';

class PlanetDetailPage extends StatelessWidget {
  final Map<String, dynamic> planet;

  const PlanetDetailPage({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(planet['name']!),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(
              spaceProvider.isLiked(planet) ? Icons.favorite : Icons.favorite_border,
              color: spaceProvider.isLiked(planet) ? Colors.red : Colors.white,
            ),
            onPressed: () {
              spaceProvider.toggleLike(planet);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Cube(
                onSceneCreated: (scene) {
                  scene.world.add(
                    Object(
                      fileName: 'assets/modals/${planet["model"]}',
                      scale: Vector3(5, 5, 5), // Adjust scale if needed
                    ),
                  );
                },
              ),
            ),
            Text(
              planet['name']!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              planet['subtitle']!,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Surface area: ${planet['surface_area']!}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Gravity: ${planet['gravity']!}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                planet['description']!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
