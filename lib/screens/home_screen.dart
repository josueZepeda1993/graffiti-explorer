import 'package:flutter/material.dart';
//import '../models/mural.dart';
import 'mural_detail_screen.dart';
import '../data/murals_data.dart';
import 'map_screen.dart';
import '../services/favorites_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen>{
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

          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapScreen(),
                ),
              );
            },
            icon: const Icon(Icons.map),
            label: const Text('Ver Mapa'),
          ),

          const SizedBox(height: 20),  

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

                    trailing: IconButton(
                      icon: Icon(
                        FavoritesService.esFavorito(mural.nombre)
                          ? Icons.favorite
                          : Icons.favorite_border,
                        color: FavoritesService.esFavorito(mural.nombre)
                          ? Colors.red
                          : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          FavoritesService.toggleFavorito(mural.nombre);
                        });
                      },
                    ),

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