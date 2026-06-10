import 'package:flutter/material.dart';
import '../models/mural.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Mural> murales = [
    Mural(
      nombre: 'Jaguar Cósmico',
      artista: 'Artista Local',
      ubicacion: 'La Campanera',
      images: 'assets/images/teko.png',
    ),
    Mural(
      nombre: 'Alas de Libertad',
      artista: 'Colectivo Urbano',
      ubicacion: 'La Campanera',
      images: 'assets/images/duwest.jpg',
    ),
    Mural(
      nombre: 'Colores del Barrio',
      artista: 'Muralistas SV',
      ubicacion: 'La Campanera',
      images: 'assets/images/muralBolivia.jpg',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          mural.images,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      ListTile(
                        leading: const Icon(Icons.palette),
                        title: Text(mural.nombre),
                        subtitle: Text(mural.artista),
                      ),
                    ],
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