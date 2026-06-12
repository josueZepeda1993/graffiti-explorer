import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Murales'),
      ),
      body: const Center(
        child: Text(
          'Mapa en construcción 🚧',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}