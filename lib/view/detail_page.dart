import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:provider/provider.dart';
import '../provider/space_provider.dart';

class PlanetDetailPage extends StatefulWidget {
  final Map<String, dynamic> planet;

  const PlanetDetailPage({super.key, required this.planet});

  @override
  State<PlanetDetailPage> createState() => _PlanetDetailPageState();
}

class _PlanetDetailPageState extends State<PlanetDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Rotation duration
    )..repeat(); // Repeats the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.planet['name']!),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(
              spaceProvider.isLiked(widget.planet)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: spaceProvider.isLiked(widget.planet)
                  ? Colors.red
                  : Colors.white,
            ),
            onPressed: () {
              spaceProvider.toggleLike(widget.planet);
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
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * 3.1416, // Full rotation
                    child: Cube(
                      onSceneCreated: (scene) {
                        scene.world.add(
                          Object(
                            fileName: 'assets/modals/${widget.planet["model"]}',
                            scale: Vector3(5, 5, 5),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Text(
              widget.planet['name']!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.planet['subtitle']!,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Surface area: ${widget.planet['surface_area']!}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Gravity: ${widget.planet['gravity']!}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                widget.planet['description']!,
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
