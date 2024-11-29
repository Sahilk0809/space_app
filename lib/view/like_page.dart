import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/space_provider.dart';

class LikedPlanetsPage extends StatelessWidget {
  const LikedPlanetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Liked Planets'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: spaceProvider.likedPlanets.length,
        itemBuilder: (context, index) {
          final planet = spaceProvider.likedPlanets[index];
          return ListTile(
            title: Text(
              planet['name']!,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              planet['subtitle']!,
              style: const TextStyle(color: Colors.white70),
            ),
          );
        },
      ),
    );
  }
}
