import 'package:flutter/material.dart';
import '../models/mural.dart';
import 'mural_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Mural> murales = [
    Mural(
      nombre: 'Jaguar Cósmico',
      artista: 'Artista Local',
      ubicacion: 'La Campanera',
      images: 'assets/images/teko.png',
      descripcion: 'Mural representativo del arte urbano local.',
      latitud: 13.7150,
      longitud: -89.1400,

    ),
    Mural(
      nombre: 'Alas de Libertad',
      artista: 'Colectivo Urbano',
      ubicacion: 'La Campanera',
      images: 'assets/images/duwest.jpg',
      descripcion: 'Mural representativo del arte urbano local.',
      latitud: 13.7150,
      longitud: -89.1400,
    ),
    Mural(
      nombre: 'Colores del Barrio',
      artista: 'Muralistas SV',
      ubicacion: 'La Campanera',
      images: 'assets/images/muralBolivia.jpg',
      descripcion: 'Mural representativo del arte urbano local.',
      latitud: 13.7150,
      longitud: -89.1400,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Graffiti Explorer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Murales',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: murales.length,
              itemBuilder: (context, index) {
                final mural = murales[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.palette),
                    title: Text(mural.nombre),
                    subtitle: Text(mural.artista),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MuralDetailScreen(mural: mural),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),  
          ],
        ),
      ),      
    );
  }
}