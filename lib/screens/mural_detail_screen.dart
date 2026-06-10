import 'package:flutter/material.dart';
import '../models/mural.dart';

class MuralDetailScreen extends StatelessWidget {
  final Mural mural;

  const MuralDetailScreen({
    super.key,
    required this.mural,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mural.nombre),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.asset(
              mural.images,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    mural.nombre,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text('Artista: ${mural.artista}'),

                  const SizedBox(height: 8),

                  Text('Ubicación: ${mural.ubicacion}'),

                  const SizedBox(height: 16),

                  Text(mural.descripcion),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}